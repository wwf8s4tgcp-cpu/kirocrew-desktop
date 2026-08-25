<p align="center">
  <img src="website/electron/icon.png" alt="Kiro Crew for Windows" width="112">
</p>

<h1 align="center">Kiro Crew Windows 桌面版</h1>

<p align="center">
  <strong>面向 Windows 的本地 AI 工作空间：安装即用，专注桌面运行体验。</strong>
</p>

<p align="center">
  <a href="README.en.md">English</a> ·
  <a href="https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/latest">下载最新版本</a> ·
  <a href="#快速开始">快速开始</a>
</p>

> 这是一个专注于 **Windows x64 桌面体验** 的 Kiro Crew 发布仓库。它基于开源 Kiro Crew 项目构建，为 Windows 提供标准安装与便携运行两种清晰的使用路径。上游项目及完整通用文档请参阅 [kirodotdev/KiroCrew](https://github.com/kirodotdev/KiroCrew)。

## 为什么是 Windows 桌面版

Kiro Crew Windows 桌面版将本地 Gateway、桌面窗口与项目工作流集中在一处。启动应用后，桌面端会连接本地服务，让你可以在熟悉的 Windows 环境中开展对话、管理任务并继续项目工作，而不必先搭建完整的开发环境。

| 重点 | 说明 |
|---|---|
| **标准安装** | 提供 Windows NSIS 安装程序，适合日常使用与开始菜单管理。 |
| **便携运行** | 提供 ZIP 便携包，解压到合适的位置后即可运行，不要求固定安装位置。 |
| **桌面集成** | 将本地 Gateway 与原生 Windows 桌面窗口结合，适合在本机持续开展工作。 |
| **本地优先** | 桌面端在本机启动并连接服务；登录与模型访问仍需要有效的 Kiro CLI 配置。 |
| **中文优先** | 本页默认中文；英文说明可在 [README.en.md](README.en.md) 查看。 |

## 下载

请在 [Release 页面](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/latest) 选择适合你的 Windows 版本。

| 包类型 | 适用场景 | 下载 |
|---|---|---|
| **安装版** | 希望通过标准安装程序完成部署的日常使用者。 | [查看 Release](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/latest) |
| **便携版** | 希望解压后直接运行、由自己管理应用位置的用户。 | [查看 Release](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/latest) |

每个 Release 都提供 SHA-256 校验文件。下载后可在 PowerShell 中核对文件完整性：

```powershell
Get-FileHash .\KiroCrew.Setup.<版本号>.exe -Algorithm SHA256
```

## 快速开始

1. 在 [Releases](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases) 下载**安装版**或**便携版**。
2. 安装版请运行安装程序；便携版请完整解压 ZIP，不要仅运行压缩包预览中的文件。
3. 启动 `Kiro Crew.exe`。首次运行时按引导完成 Kiro CLI 登录或使用现有登录状态。
4. 创建或打开工作会话，开始在桌面端继续你的任务。

## 安装版与便携版如何选择

| 对比项 | 安装版 | 便携版 |
|---|---|---|
| 部署方式 | 运行安装程序 | 解压 ZIP 后运行 |
| 适合场景 | 固定电脑上的日常使用 | 临时环境或希望自行控制文件位置 |
| 应用位置 | 由安装程序管理 | 由你选择解压位置 |

## 使用前须知

- 当前发布物面向 **Windows x64**。
- 请为应用、项目和后端依赖预留充足磁盘空间。
- 此 Release 中的 Windows 安装程序目前未进行 Authenticode 代码签名。Windows 可能显示发布者提示；请仅从本仓库的 [Releases](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases) 页面下载，并自行核对 SHA-256。
- 由于未签名安装包不应绕过 Windows 的发布者验证，当前版本作为**手动下载与安装**发布；应用内静默自动安装需要后续配置受信任的 Windows 代码签名证书与兼容更新源。

## 从源码构建

本仓库保留完整源码与自动发布工作流。对于希望自行检查、修改或构建桌面端的用户，请先阅读 [贡献指南](CONTRIBUTING.md) 与 [Windows 安装说明](docs/guides/windows-install.md)。发布工作流位于 [`.github/workflows/publish-github-release.yml`](.github/workflows/publish-github-release.yml)。

## 署名与许可证

| 归属 | 署名 |
|---|---|
| 原始项目作者 | [Kiro 团队](https://github.com/kirodotdev/KiroCrew) |
| Windows 桌面版维护与发布 | [@wwf8s4tgcp](https://github.com/wwf8s4tgcp) |

项目采用 [Apache License 2.0](LICENSE)。请保留原项目的许可证、NOTICE 与第三方声明。

---

如果你希望改进 Windows 版体验、报告问题或提出建议，欢迎在本仓库提交 [Issue](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/issues)。
