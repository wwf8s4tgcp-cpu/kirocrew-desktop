<p align="center">
  <img src="website/electron/icon.png" alt="Kiro Crew for Windows" width="112">
</p>

<h1 align="center">Kiro Crew for Windows</h1>

<p align="center">
  <strong>A Windows-focused local AI workspace: install it, run it on your desktop, and choose where your projects live.</strong>
</p>

<p align="center">
  <a href="README.md">中文</a> ·
  <a href="https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/latest">Latest download</a> ·
  <a href="#quick-start">Quick start</a> ·
  <a href="#whats-new-in-051">What’s new in 0.5.1</a>
</p>

> This is a **Windows x64 desktop distribution** of Kiro Crew. It is built from the open-source Kiro Crew project and provides a clear Windows path for standard installation, portable use, and choosing a project location. For the upstream project and cross-platform documentation, see [kirodotdev/KiroCrew](https://github.com/kirodotdev/KiroCrew).

## Why a Windows desktop edition

Kiro Crew for Windows brings the local Gateway, desktop window, and project workflow together. Start the application to connect to the local service and continue conversations, manage tasks, and work with projects from a familiar Windows environment—without first assembling a complete development setup.

| Focus | What it means |
|---|---|
| **Standard installation** | A Windows NSIS installer for regular use and Start menu integration. |
| **Portable use** | A ZIP package that can be extracted and run from a directory you choose. |
| **Native folder selection** | Choose a project working directory with the Windows folder dialog, including `D:`, `E:`, removable storage, or an accessible network location. |
| **Local first** | The desktop app starts and connects to local services; model access still requires a valid Kiro CLI configuration. |
| **Chinese first, English available** | The repository homepage defaults to [Chinese](README.md); this document provides the English edition. |

## Download

The current Windows release is **0.5.1**. Pick the package that suits your workflow on the [Release page](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/tag/desktop-v0.5.1).

| Package | Best for | Download |
|---|---|---|
| **Installer** | Everyday use on a regular Windows workstation. | [`KiroCrew.Setup.0.5.1.exe`](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/download/desktop-v0.5.1/KiroCrew.Setup.0.5.1.exe) |
| **Portable ZIP** | Running from a non-system drive, removable storage, or a self-managed location. | [`KiroCrew.Portable.0.5.1.win-x64.zip`](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/download/desktop-v0.5.1/KiroCrew.Portable.0.5.1.win-x64.zip) |

Each release includes a SHA-256 checksum file. To verify the installer in PowerShell:

```powershell
Get-FileHash .\KiroCrew.Setup.0.5.1.exe -Algorithm SHA256
```

## What’s new in 0.5.1

### Choose a working directory outside `C:`

Version 0.5.1 adds a **native Windows project-directory picker**. When selecting a project folder in the desktop app, you can choose another drive instead of being constrained to `C:`. For example, a project can live in `D:\Projects\my-workspace`, on an external drive, or at a mounted network location to which you have access.

This is useful when large projects, repositories, and working files should remain separate from the system drive. The application uses the folder you explicitly select as the current project location. Make sure that your Windows account can read and write the folder, and avoid shared locations that expose sensitive project data to others.

| Situation | Recommendation |
|---|---|
| Limited system-drive capacity | Create a dedicated workspace on `D:` or another data drive. |
| Portable edition | Extract the ZIP to a non-system drive and select a project folder on the same drive for simpler management. |
| External storage | Keep the drive connected while using the project; paths become unavailable after it is disconnected. |
| Network location | Confirm stable read/write permissions and account for network latency. |

## Quick start

1. Download the **Installer** or **Portable ZIP**. Extract the complete ZIP before using the portable build; do not run files directly from the archive preview.
2. Start `Kiro Crew.exe`. On first launch, follow the Kiro CLI sign-in guidance or use an existing authenticated session.
3. Use **Choose Folder** in the project selection view to open the native Windows dialog, then select your working directory. It may be on `D:`, `E:`, or another accessible drive.
4. Create or open a work session and continue your tasks from the desktop app.

## Installer or portable ZIP?

| Comparison | Installer | Portable ZIP |
|---|---|---|
| Deployment | Run the Windows setup program | Extract the ZIP and run it |
| Best for | Regular use on one workstation | Non-system drives, temporary environments, or self-managed locations |
| Application location | Managed by the installer | Chosen by you when extracting |
| Project directory | Set with the native folder picker | Set with the same native folder picker |

## Before you use it

- These packages target **Windows x64**.
- Reserve sufficient disk space for the application, project directory, and backend dependencies. A data drive is recommended for large workspaces.
- The current Windows installer is not Authenticode-signed. Windows may display a publisher warning. Download only from this repository’s [Releases](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases) page and verify the SHA-256 checksum yourself.
- This release is intended for **manual download and installation**. It does not bypass Windows publisher verification; in-app silent installation requires a trusted Windows code-signing certificate and a compatible update feed.

## Build from source

The repository retains the full source tree and release automation. If you want to inspect, modify, or build the desktop app yourself, begin with the [contribution guide](CONTRIBUTING.md) and the [Windows installation guide](docs/guides/windows-install.md). The publishing workflow is [`.github/workflows/publish-github-release.yml`](.github/workflows/publish-github-release.yml).

## License and attribution

This project is available under the [Apache License 2.0](LICENSE). This Windows distribution is built from the open-source [Kiro Crew](https://github.com/kirodotdev/KiroCrew) project; please retain the upstream license, NOTICE, and third-party notices.

---

To suggest a Windows-specific improvement or report an issue, open an [issue](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/issues) in this repository.
