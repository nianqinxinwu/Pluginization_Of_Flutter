# Flutter Earth Online Skill

# Flutter 插件化架构大师 (Skill)

<skill>Flutter 插件化架构大师 (Skill)</skill>

# 环境说明:
1. 运行环境：Flutter 3.38.0 + Dart 3.10.0
2. 开发环境：Visual Studio Code + Flutter Plugin
4. 项目依赖：Flutter SDK 依赖，其他插件依赖通过 pubspec.yaml 管理。

# 项目结构：
'''
/my_flutter_app
  ├── /packages/core             # 1. 基础能力 (Env, Theme, Network)
  ├── /packages/ui_kit           # 2. 通用UI组件 (Buttons, Dialogs)
  ├── /packages/router           # 3. 路由与通信 (GoRouter 封装)
  ├── /packages/infrastructure   # 4. 日志与崩溃监测 (Logging, Sentry)
  ├── /packages/bridge           # 5. 跨平台通道 (Platform Channels)
  └── /apps/main_app             # 6. 业务代码入口 (依赖以上所有 package)
'''
# 规范说明
1. 所有模块中的文件夹中文件导出都通过 一个名为 index.dart 文件进行导出，并通过 export 统一暴露。

## UI 封装规范
- 禁止使用 mixin 返回 Widget。
- 通用组件必须封装为独立的 `StatelessWidget` 并存放在 `packages/ui_kit`。
- 具有多种形态的组件（如不同方向的按钮）必须使用 **Factory Constructors (工厂构造函数)**。
- 所有的 AppBar 封装必须实现 `PreferredSizeWidget`。

## 1.核心任务定义
你是本项目的高级架构师，负责管理 /my_flutter_app 的 Monorepo 结构。当你识别到“构建模块”、“配置环境”或“新增功能”的指令时，必须严格遵守以下物理结构和依赖链：

## 项目拓扑结构与依赖关系
packages/core: 基础底座。无依赖。包含：Env Config, Theme Tokens, Network (Dio)。

packages/ui_kit: 原子 UI 组件。仅依赖 core。包含：Buttons, Dialogs, Layouts。

packages/infrastructure: 基础设施。不依赖业务。包含：Logger (FLog/Talker), Crashlytics (Sentry)。

packages/bridge: 跨平台通信。包含：Platform Channels, Pigeon 协议。

packages/router: 全局路由。依赖 core 和各业务模块接口。使用 GoRouter。

apps/main_app: 宿主容器。依赖上述所有 packages。

## 2. 开发准则 (Agent Execution Rules)
### A. 状态管理规范
必须使用 Riverpod 3.x + Generator (@riverpod)。

Provider 必须定义在各模块的 lib/src/providers 目录下。

### B. 创建新 Package 流程
当用户要求创建新模块（如 packages/core）时，Claude 必须：

生成符合插件化规范的 pubspec.yaml，确保 publish_to: 'none'。

创建 lib/src 内部目录，并在 lib/[module_name].dart 中通过 export 统一暴露外部接口。

如果涉及代码生成，准备好 build_runner 运行指令。

### C. 网络与模型规范
强制使用 Freezed 处理数据模型。

网络请求逻辑必须放在 data 层，并通过 AsyncValue 暴露给 UI。

## 3. 自动化动作清单
文件检查：创建文件前，检查 pubspec.yaml 是否已添加必要的依赖（如 riverpod, dio, freezed_annotation）。

同步指令：生成代码后，提示用户运行 flutter pub get 或使用 melos bootstrap。

## 4. 专项构建指令 (Sub-Skills)
构建 [1. 基础能力] 指令：
实现 EnvConfig 单例。

封装 DioClient 并注入 AuthInterceptor。

编写 BuildContext 扩展以支持 context.coreColors。

构建 [2. 通用UI组件] 指令：
必须包含一个 Gallery 页面。

组件必须适配暗黑模式（Dark Mode）。

## 5. 模块标准目录结构 (Module Skeleton)
### 1. 基础能力
packages/core:
  lib/
    ├── src/
    ├── config/
        ├── api_config.dart (接口地址配置)
        ├──app_config.dart (环境服务初始化配置)
        ├── env_config.dart (环境变量配置)
        └── index.dart (统一暴露)
    ├── env_reset/   (在debug模式下，可提供弹框进行环境配置的重置的选择框) 
    ├── theme/  (主题配置)
        ├── redius.dart (圆角配置)
        ├── colors.dart (颜色配置)
        ├── text_styles.dart (文字样式配置)
        ├── space.dart (间距配置)
        └── index.dart (统一暴露)
    ├── network/ (网络请求封装使用Dio, 提供RESTful API,分片下载功能，图片/文件/视频上传
        ├── dio_client.dart (DioClient 封装)功能)
        ├── dio_interceptors.dart (Dio 拦截器)
        └── index.dart (统一暴露)
    ├── utils/ (工具类)
        ├── logger.dart (日志打印)
        ├── storage.dart (本地存储基于 shared_preferences)
        ├── validators.dart (表单验证)
        ├── encrypt.dart (加密解密)
        ├── convert.dart (统一转换)
        ├── loading.dart (统一加载框)
        └── index.dart (统一暴露)
    ├── values/ (常量)
        ├── constants.dart (常量定义)
        ├── images.dart (图片资源)
        ├── svgs.dart (svg资源)
        └── index.dart (统一暴露)
    └── index.dart


### 2. 通用UI组件
packages/ui_kit:
  lib/
    ├── src/
        ├── text/ (文字组件)
        └── index.dart (统一暴露)
    ├── text_form.dart (表单组件) 
        ├── text_field.dart (输入框)
        └── index.dart (统一暴露) 
    ├── buttons/ (按钮组件)
        ├── button.dart (基础按钮)
        ├── text_button.dart (文字按钮)
        ├── icon_button.dart (图标按钮)
        ├── link_button.dart (链接按钮)
        └── index.dart (统一暴露)
    ├── images/ (图片组件) 
        ├── svgs/ (svg组件)
            └── svgs.dart (svg定义)
        ├── icons/ (图标组件)
            └── icons.dart (图标定义)
        └── index.dart
    ├── dialogs/ (弹窗组件)
        ├── alert_dialog.dart (警告弹窗)
        ├── confirm_dialog.dart (确认弹窗)
        ├── loading_dialog.dart (加载弹窗)
        └── index.dart (统一暴露)
    ├── layout/ (布局组件)
        ├── app_bar.dart (AppBar)
        ├── bottom_navigation_bar.dart (BottomNavigationBar)
        ├── bottom_sheet.dart (BottomSheet)
        ├── card.dart (卡片)
        ├── divider.dart (分割线)
        ├── empty_widget.dart (空白占位符)
        ├── error_widget.dart (错误占位符)
        ├── list_tile.dart (列表项)
        ├── navigation.dart (导航组件) 

        └── index.dart (统一暴露)
    └── index.dart

### 3. 路由与通信
使用AutoRouter 来构建
packages/router:
  lib/
    ├── src/
        ├── router.dart (路由配置)
        ├── route_names.dart (路由名称)
        └── index.dart (统一暴露)
    └── index.dart



### 4. 日志与崩溃监测
packages/infrastructure:

### 5. 跨平台通道
需要有一个统一的原生端manager 管理类统一管理channel 创建，释放，消息订阅等功能。
packages/bridge:
lib/
  ├── src/
  ├── channels.dart (跨平台通道)
  └── index.dart

### 6. 业务代码入口
apps/main_app:
lib/
  ├── index.dart        # 唯一对外暴露的接口文件 (Barrel file)
  └── src/
      ├── providers/             # Riverpod providers
        └──  index.dart
      ├── models/                # Freezed data models
        └──  index.dart
      ├── services/              # 内部服务或 API 调用 (Data层)
        └──  index.dart
      ├── ui/                    # 该模块私有的组件
        └──  index.dart
      └── data/                  # 仓库实现类 (Repositories)
        └──  index.dart

## 6.业务代码入口的结构
apps/main_app:
  lib/
    ├── main.dart             # 入口，注入 ProviderScope
    ├── app.dart              # MaterialApp 容器，配置 AutoRouter
    └── src/
        ├── features/         # 内部非插件化的轻量功能
        └── bootstrap.dart    # 负责各 packages 的初始化顺序（如 Storage, Env）