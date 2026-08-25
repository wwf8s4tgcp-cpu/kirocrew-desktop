[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = "High")]
param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern("^[^/\s]+/[^/\s]+$")]
    [string]$Repository,

    [Parameter(Mandatory = $true)]
    [ValidatePattern("^(?:desktop-)?v?\d+\.\d+\.\d+(?:[-+][0-9A-Za-z.-]+)?$")]
    [string]$Tag,

    [string]$InstallerPath = "",
    [string]$NotesFile = "",
    [switch]$Prerelease,
    [switch]$Draft
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot

if (-not $InstallerPath) {
    $InstallerPath = Join-Path $repoRoot "desktop-output\KiroCrew Setup 0.5.0.exe"
}
$InstallerPath = [System.IO.Path]::GetFullPath($InstallerPath)
if (-not (Test-Path -LiteralPath $InstallerPath -PathType Leaf)) {
    throw "Installer not found: $InstallerPath"
}
if ($NotesFile -and -not (Test-Path -LiteralPath $NotesFile -PathType Leaf)) {
    throw "Release notes file not found: $NotesFile"
}

$releaseTag = $Tag
$versionTag = $Tag -replace "^desktop-", ""
if (-not $versionTag.StartsWith("v")) {
    $versionTag = "v$versionTag"
}
$version = $versionTag.Substring(1)
$title = "Kiro Crew $version"
$installerName = Split-Path -Leaf $InstallerPath
$assetDirectory = Split-Path -Parent $InstallerPath
$checksumPath = Join-Path $assetDirectory "$installerName.sha256"
$metadataPath = Join-Path $assetDirectory "latest.yml"
$blockmapPath = "$InstallerPath.blockmap"

if ($WhatIfPreference) {
    Write-Output "Would publish GitHub Release $releaseTag to $Repository"
    Write-Output "Installer: $InstallerPath"
    Write-Output "Would create: $checksumPath"
    Write-Output "Would create: $metadataPath"
    if (Test-Path -LiteralPath $blockmapPath -PathType Leaf) {
        Write-Output "Would upload blockmap: $blockmapPath"
    }
    return
}

$sha256 = (Get-FileHash -LiteralPath $InstallerPath -Algorithm SHA256).Hash.ToLowerInvariant()
$sha512Algorithm = [System.Security.Cryptography.SHA512]::Create()
try {
    $sha512 = [Convert]::ToBase64String($sha512Algorithm.ComputeHash([System.IO.File]::ReadAllBytes($InstallerPath)))
} finally {
    $sha512Algorithm.Dispose()
}
$installerSize = (Get-Item -LiteralPath $InstallerPath).Length
$releaseDate = [DateTime]::UtcNow.ToString("o")

Set-Content -LiteralPath $checksumPath -Value "$sha256 *$installerName" -Encoding ascii
$metadata = @(
    "version: $version",
    "files:",
    "  - url: $installerName",
    "    sha512: $sha512",
    "    size: $installerSize",
    "path: $installerName",
    "sha512: $sha512",
    "releaseDate: '$releaseDate'"
) -join [Environment]::NewLine
Set-Content -LiteralPath $metadataPath -Value $metadata -Encoding utf8

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw "GitHub CLI (gh) is required. Install it, authenticate with 'gh auth login', then retry."
}
& gh auth status --hostname github.com
if ($LASTEXITCODE -ne 0) {
    throw "GitHub CLI is not authenticated for github.com. Run 'gh auth login' and retry."
}

$assets = @($InstallerPath, $checksumPath, $metadataPath)
if (Test-Path -LiteralPath $blockmapPath -PathType Leaf) {
    $assets += $blockmapPath
}

$releaseExists = $false
& gh release view $releaseTag --repo $Repository 2>$null
if ($LASTEXITCODE -eq 0) {
    $releaseExists = $true
}

if ($releaseExists) {
    if ($PSCmdlet.ShouldProcess("$Repository release $releaseTag", "Replace release assets")) {
        & gh release upload $releaseTag --repo $Repository --clobber @assets
        if ($LASTEXITCODE -ne 0) { throw "GitHub Release asset upload failed." }
    }
} elseif ($PSCmdlet.ShouldProcess("$Repository release $releaseTag", "Create GitHub Release and upload installer assets")) {
    $releaseArgs = @("release", "create", $releaseTag, "--repo", $Repository, "--verify-tag", "--title", $title)
    if ($Prerelease) { $releaseArgs += "--prerelease" }
    if ($Draft) { $releaseArgs += "--draft" }
    if ($NotesFile) {
        $releaseArgs += @("--notes-file", [System.IO.Path]::GetFullPath($NotesFile))
    } else {
        $releaseArgs += "--generate-notes"
    }
    $releaseArgs += $assets
    & gh @releaseArgs
    if ($LASTEXITCODE -ne 0) { throw "GitHub Release creation failed." }
}

Write-Output "Published $releaseTag with $installerName, $installerName.sha256, and latest.yml"
