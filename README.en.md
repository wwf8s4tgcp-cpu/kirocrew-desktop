<p align="center">
  <img src="website/electron/icon.png" alt="Kiro Crew for Windows" width="112">
</p>

<h1 align="center">Kiro Crew for Windows</h1>

<p align="center">
  <strong>A Windows-focused local AI workspace: install it and keep work moving from your desktop.</strong>
</p>

<p align="center">
  <a href="README.md">中文</a> ·
  <a href="https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/latest">Latest download</a> ·
  <a href="#quick-start">Quick start</a>
</p>

> This is a **Windows x64 desktop distribution** of Kiro Crew. It is built from the open-source Kiro Crew project and provides a clear Windows path for standard installation and portable use. For the upstream project and cross-platform documentation, see [kirodotdev/KiroCrew](https://github.com/kirodotdev/KiroCrew).

## Why a Windows desktop edition

Kiro Crew for Windows brings the local Gateway, desktop window, and project workflow together. Start the application to connect to the local service and continue conversations, manage tasks, and work with projects from a familiar Windows environment—without first assembling a complete development setup.

| Focus | What it means |
|---|---|
| **Standard installation** | A Windows NSIS installer for regular use and Start menu integration. |
| **Portable use** | A ZIP package that can be extracted and run from a location you choose. |
| **Desktop integration** | A native Windows desktop window paired with a local Gateway for ongoing work on your machine. |
| **Local first** | The desktop app starts and connects to local services; model access still requires a valid Kiro CLI configuration. |
| **Chinese first, English available** | The repository homepage defaults to [Chinese](README.md); this document provides the English edition. |

## Download

Choose the Windows package that fits your workflow from the [latest Release](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/latest).

| Package | Best for | Download |
|---|---|---|
| **Installer** | Everyday use on a regular Windows workstation. | [View Release](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/latest) |
| **Portable ZIP** | Running after extraction while managing the application location yourself. | [View Release](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/latest) |

Each release includes a SHA-256 checksum file. To verify an installer in PowerShell:

```powershell
Get-FileHash .\KiroCrew.Setup.<version>.exe -Algorithm SHA256
```

## Quick start

1. Download the **Installer** or **Portable ZIP** from [Releases](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases).
2. Run the installer for the installed edition. For the portable edition, extract the full ZIP before use; do not run files directly from the archive preview.
3. Start `Kiro Crew.exe`. On first launch, follow the Kiro CLI sign-in guidance or use an existing authenticated session.
4. Create or open a work session and continue your tasks from the desktop app.

## Installer or portable ZIP?

| Comparison | Installer | Portable ZIP |
|---|---|---|
| Deployment | Run the Windows setup program | Extract the ZIP and run it |
| Best for | Regular use on one workstation | Temporary environments or a self-managed application location |
| Application location | Managed by the installer | Chosen by you when extracting |

## Before you use it

- These packages target **Windows x64**.
- Reserve sufficient disk space for the application, projects, and backend dependencies.
- The current Windows installer is not Authenticode-signed. Windows may display a publisher warning. Download only from this repository’s [Releases](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases) page and verify the SHA-256 checksum yourself.
- This distribution is intended for **manual download and installation**. It does not bypass Windows publisher verification; in-app silent installation requires a trusted Windows code-signing certificate and a compatible update feed.

## Build from source

The repository retains the full source tree and release automation. If you want to inspect, modify, or build the desktop app yourself, begin with the [contribution guide](CONTRIBUTING.md) and the [Windows installation guide](docs/guides/windows-install.md). The publishing workflow is [`.github/workflows/publish-github-release.yml`](.github/workflows/publish-github-release.yml).

## Attribution and license

| Role | Attribution |
|---|---|
| Original project author | [Kiro Team](https://github.com/kirodotdev/KiroCrew) |
| Windows desktop edition maintenance and publishing | [@wwf8s4tgcp](https://github.com/wwf8s4tgcp) |

This project is available under the [Apache License 2.0](LICENSE). Please retain the upstream license, NOTICE, and third-party notices.

---

To suggest a Windows-specific improvement or report an issue, open an [issue](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/issues) in this repository.
