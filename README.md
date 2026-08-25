<p align="center">
  <img src="website/electron/icon.png" alt="Kiro Crew for Windows" width="112">
</p>

<h1 align="center">Kiro Crew Windows 桌面版</h1>

<p align="center">
  <strong>面向 Windows 的本地 AI 工作空间：安装即用、桌面运行、项目位置由你决定。</strong>
</p>

<p align="center">
  <a href="README.en.md">English</a> ·
  <a href="https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/latest">下载最新版本</a> ·
  <a href="#快速开始">快速开始</a> ·
  <a href="#0501-新增功能">0.5.1 新功能</a>
</p>

> 这是一个专注于 **Windows x64 桌面体验** 的 Kiro Crew 发布仓库。它基于开源 Kiro Crew 项目构建，并为 Windows 的安装、便携运行与项目目录选择提供了清晰的使用路径。上游项目及完整通用文档请参阅 [kirodotdev/KiroCrew](https://github.com/kirodotdev/KiroCrew)。

## 为什么是 Windows 桌面版

Kiro Crew Windows 桌面版将本地 Gateway、桌面窗口与项目工作流集中在一处。启动应用后，桌面端会连接本地服务，让你可以在熟悉的 Windows 环境中开展对话、管理任务并继续项目工作，而不必先搭建完整的开发环境。

| 重点 | 说明 |
|---|---|
| **标准安装** | 提供 Windows NSIS 安装程序，适合日常使用与开始菜单管理。 |
| **便携运行** | 提供 ZIP 便携包，解压到任意目录后即可运行，不要求固定安装位置。 |
| **原生目录选择** | 可从 Windows 原生目录选择器指定项目工作目录，包括 `D:`、`E:`、外接磁盘或可访问的网络位置。 |
| **本地优先** | 桌面端在本机启动并连接服务；登录与模型访问仍需要有效的 Kiro CLI 配置。 |
| **中文优先** | 本页默认中文；英文说明可在 [README.en.md](README.en.md) 查看。 |

## 下载

当前 Windows 版本为 **0.5.1**。请在 [Release 页面](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/tag/desktop-v0.5.1) 选择适合你的包。

| 包类型 | 适用场景 | 下载 |
|---|---|---|
| **安装版** | 希望通过标准安装程序完成部署的日常使用者。 | [`KiroCrew.Setup.0.5.1.exe`](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/download/desktop-v0.5.1/KiroCrew.Setup.0.5.1.exe) |
| **便携版** | 希望放在非系统盘、移动硬盘或独立目录中运行的用户。 | [`KiroCrew.Portable.0.5.1.win-x64.zip`](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases/download/desktop-v0.5.1/KiroCrew.Portable.0.5.1.win-x64.zip) |

每个 Release 同时附带 SHA-256 校验文件。下载后可在 PowerShell 中执行下列命令核对安装包完整性：

```powershell
Get-FileHash .\KiroCrew.Setup.0.5.1.exe -Algorithm SHA256
```

## 0.5.1 新增功能

### 可选择 C 盘以外的工作目录

新版本新增 **Windows 原生项目目录选择器**。在桌面端选择项目目录时，可以直接定位到其他盘符，而不再受限于 `C:`。例如，你可以将项目放在 `D:\Projects\my-workspace`、外接硬盘，或企业网络中已挂载且有访问权限的位置。

这项能力适合希望把大型项目、代码仓库和工作文件与系统盘分离的用户。应用会使用你明确选择的目录作为当前项目工作位置；请确保该目录对当前 Windows 用户可读写，并避免将敏感数据放入他人可访问的共享目录。

| 使用情形 | 建议 |
|---|---|
| 系统盘空间有限 | 在 `D:` 或其他数据盘创建专用项目目录。 |
| 使用便携版 | 将 ZIP 解压到非系统盘，并在同一数据盘选择项目目录，便于集中管理。 |
| 外接磁盘 | 仅在磁盘稳定连接时使用；断开后相关项目路径将不可访问。 |
| 网络位置 | 确认当前账户具有稳定的读写权限，并注意网络延迟。 |

## 快速开始

1. 下载**安装版**或**便携版**。便携版需要完整解压 ZIP，不要仅运行压缩包预览中的文件。
2. 启动 `Kiro Crew.exe`。首次运行时按引导完成 Kiro CLI 登录或使用现有登录状态。
3. 在项目选择界面使用“选择文件夹”打开 Windows 原生目录对话框，然后指定你的工作目录；该目录可以在 `D:`、`E:` 等非系统盘。
4. 创建或打开工作会话，开始在桌面端继续你的任务。

## 安装版与便携版如何选择

| 对比项 | 安装版 | 便携版 |
|---|---|---|
| 部署方式 | 运行安装程序 | 解压 ZIP 后运行 |
| 适合场景 | 固定电脑上的日常使用 | 非系统盘、临时环境或希望自行控制文件位置 |
| 应用位置 | 由安装程序管理 | 由你选择解压位置 |
| 项目工作目录 | 可通过原生目录选择器设置 | 同样可通过原生目录选择器设置 |

## 使用前须知

- 当前发布物面向 **Windows x64**。
- 请为应用、项目目录和后端依赖预留充足磁盘空间；建议使用空间充足的数据盘保存大型工作区。
- 此 Release 中的 Windows 安装程序目前未进行 Authenticode 代码签名。Windows 可能显示发布者提示；请仅从本仓库的 [Releases](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/releases) 页面下载，并自行核对 SHA-256。
- 由于未签名安装包不应绕过 Windows 的发布者验证，当前版本作为**手动下载与安装**发布；应用内静默自动安装需要后续配置受信任的 Windows 代码签名证书与兼容更新源。

## 从源码构建

本仓库保留完整源码与自动发布工作流。对于希望自行检查、修改或构建桌面端的用户，请先阅读 [贡献指南](CONTRIBUTING.md) 与 [Windows 安装说明](docs/guides/windows-install.md)。发布工作流位于 [`.github/workflows/publish-github-release.yml`](.github/workflows/publish-github-release.yml)。

## 许可证与致谢

项目采用 [Apache License 2.0](LICENSE)。本 Windows 发布仓库基于开源 [Kiro Crew](https://github.com/kirodotdev/KiroCrew) 构建；请保留原项目的许可证、NOTICE 与第三方声明。

---

如果你希望改进 Windows 版体验、报告问题或提出建议，欢迎在本仓库提交 [Issue](https://github.com/wwf8s4tgcp-cpu/kirocrew-desktop/issues)。
