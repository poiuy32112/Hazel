# Hazel 2D Game Engine - 学习实现

Hazel 2D Game Engine 学习项目

这是一个基于 [TheCherno 的 Hazel 引擎教程](https://github.com/TheCherno/Hazel) 的学习实现项目。本项目主要专注于2D渲染和交互式应用程序开发，目前正在逐步实现各种功能模块。此项目的开发过程遵循了YouTube上的视频教程系列。

---

## 开始使用

推荐使用 Visual Studio 2019 或 2022，本项目主要在 Windows 环境下开发和测试。

**1. 下载仓库：**

使用以下命令克隆仓库（包含子模块）：
```bash
git clone --recursive https://github.com/your-username/your-hazel-project
```

如果之前已经克隆但没有包含子模块，请使用：
```bash
git submodule update --init
```

**2. 配置依赖项：**

1. 运行位于 `scripts` 文件夹中的 `Setup.bat` 文件。这将下载项目所需的依赖项。
2. 该脚本会检查 Vulkan SDK 是否已安装。如果未安装，脚本将提示安装。
3. 安装完成后，再次运行 `Setup.bat` 文件。
4. 脚本将自动执行 `Win-GenProjects.bat`，生成 Visual Studio 解决方案文件。

如果需要重新生成项目文件，请重新运行位于 `scripts` 文件夹中的 `Win-GenProjects.bat` 脚本。

---

## 项目规划

本项目旨在实现一个功能完整的2D游戏引擎，同时作为学习游戏引擎设计和架构的教育工具。开发进度会相对较慢，因为每个功能都需要仔细学习和理解后再实现。

### 已实现的主要功能：

- [x] 基础应用程序框架
- [x] 事件系统
- [x] 渲染系统基础
- [x] ImGui 集成
- [x] 基础场景管理
- [ ] 完整的2D渲染器
- [ ] 纹理管理
- [ ] 音频系统
- [ ] 物理系统集成

### 计划实现的功能：

* **快速2D渲染** (UI、粒子、精灵等)
* **高质量基于物理的渲染**
* **跨平台支持**
  * 原生渲染API支持 (DirectX, Vulkan, OpenGL)
* **完整的编辑器应用程序**
* **脚本系统**
* **集成物理引擎**
* **音频系统**

## 短期目标

_注意：这些目标可能会根据学习进度随时调整_

当前的主要目标是构建一个可用的2D工作流程：

* 使用编辑器设计游戏场景
* 在编辑器中测试游戏，包括保存/加载功能
* 在沙盒中加载和运行游戏

最终目标是能够使用这个引擎创建一个完整的2D游戏，并在桌面平台（Windows）上运行。

---

## 项目结构

```
Hazel/
├── Hazel/              # 引擎核心库
├── Hazelnut/           # 编辑器应用程序
├── Sandbox/            # 测试/示例应用程序
├── scripts/            # 构建脚本
└── vendor/             # 第三方依赖库
```

## 依赖项

- **GLFW** - 窗口管理
- **Glad** - OpenGL加载器
- **ImGui** - 即时模式GUI
- **glm** - 数学库
- **spdlog** - 日志库
- **stb_image** - 图像加载
- **entt** - 实体组件系统

## 致谢

感谢 [TheCherno](https://github.com/TheCherno) 提供的优秀教程和开源Hazel引擎项目，这个学习项目完全基于他的教程系列开发。

## 许可证

本项目仅用于学习目的。原始Hazel引擎使用Apache-2.0许可证。

---

**注意：** 这是一个学习项目，不适用于生产环境。如果你需要一个成熟的游戏引擎，请考虑使用 Unreal Engine、Unity 或其他商业解决方案。
