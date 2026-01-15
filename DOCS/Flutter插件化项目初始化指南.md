# Flutter 插件化项目初始化指南

> 基于 Melos 的 Flutter Monorepo 架构实践

## 目录

1. [项目结构设计](#1-项目结构设计)
2. [Melos 安装与配置](#2-melos-安装与配置)
3. [melos.yaml 配置详解](#3-melosyaml-配置详解)
4. [包依赖配置](#4-包依赖配置)
5. [常用命令与技巧](#5-常用命令与技巧)
6. [注意事项与最佳实践](#6-注意事项与最佳实践)

---

## 1. 项目结构设计

### 1.1 推荐目录结构

```
/flutter_earth_online          # 项目根目录
├── melos.yaml                 # Melos 配置文件 (必须)
├── pubspec.yaml               # 根目录 pubspec (workspace 配置)
├── CLAUDE.md                  # AI 辅助开发指南
├── /packages/                 # 功能模块包
│   ├── /core/                 # 基础能力 (Env, Theme, Network)
│   ├── /ui_kit/               # 通用 UI 组件
│   ├── /router/               # 路由管理
│   ├── /infrastructure/       # 基础设施 (日志、监控)
│   └── /bridge/               # 跨平台通道
└── /apps/                     # 应用入口
    └── /main_app/             # 主应用
```

### 1.2 模块划分原则

| 模块类型 | 职责 | 依赖关系 |
|---------|------|---------|
| `core` | 环境配置、主题、网络基础 | 无依赖，作为底座 |
| `ui_kit` | 通用 UI 组件库 | 依赖 core |
| `infrastructure` | 日志、崩溃监测 | 无业务依赖 |
| `bridge` | 原生通道封装 | 无业务依赖 |
| `router` | 路由与页面通信 | 依赖 core |
| `main_app` | 业务代码入口 | 依赖所有 packages |

---

## 2. Melos 安装与配置

### 2.1 安装 Melos

```bash
# 全局安装 Melos
dart pub global activate melos

# 验证安装
melos --version

# 确保 PATH 包含 pub-cache/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

### 2.2 初始化项目

```bash
# 1. 创建根目录
mkdir flutter_earth_online && cd flutter_earth_online

# 2. 创建 melos.yaml (见下节详解)

# 3. 创建目录结构
mkdir -p packages/{core,ui_kit,router,infrastructure,bridge}
mkdir -p apps/main_app

# 4. 在每个子包中创建 Flutter package
cd packages/core && flutter create --template=package .
# 重复其他包...

# 5. 引导项目
melos bootstrap
```

---

## 3. melos.yaml 配置详解

### 3.1 基础配置

```yaml
# melos.yaml
name: flutter_earth_online  # 项目名称，用于日志和标识

# 包路径配置 - 告诉 Melos 去哪里找子包
packages:
  - packages/*              # packages 下的所有一级目录
  - apps/*                  # apps 下的所有一级目录
```

### 3.2 Bootstrap 配置

```yaml
command:
  bootstrap:
    # 关键配置：使用 pubspec_overrides.yaml
    usePubspecOverrides: true

    # 可选：在 bootstrap 时自动运行
    runPubGetInParallel: true  # 并行执行 pub get (默认 true)

    # 可选：环境变量
    environment:
      sdk: ">=3.10.0 <4.0.0"
      flutter: ">=3.38.0"
```

**`usePubspecOverrides: true` 的作用：**

- 创建 `pubspec_overrides.yaml` 文件
- 将本地包依赖自动链接
- 避免发布时的路径依赖问题
- **强烈推荐开启**

### 3.3 Scripts 配置

```yaml
scripts:
  # 基础命令
  analyze:
    run: melos exec -- flutter analyze
    description: Run flutter analyze in all packages

  test:
    run: melos exec -- flutter test
    description: Run flutter test in all packages

  # 代码生成 (Freezed, Riverpod, AutoRouter)
  build_runner:
    run: melos exec -- flutter pub run build_runner build --delete-conflicting-outputs
    description: Run build_runner in all packages

  # 清理
  clean:
    run: melos exec -- flutter clean
    description: Run flutter clean in all packages

  # 获取依赖
  pub_get:
    run: melos exec -- flutter pub get
    description: Run flutter pub get in all packages
```

### 3.4 高级 Scripts 配置

```yaml
scripts:
  # 只在特定包运行
  build_runner:core:
    run: melos exec --scope="core" -- flutter pub run build_runner build --delete-conflicting-outputs
    description: Run build_runner only in core package

  # 过滤条件
  test:unit:
    run: melos exec --ignore="*_integration_test" -- flutter test
    description: Run unit tests only

  # 带依赖的包
  build_runner:depends:
    run: melos exec --depends-on="freezed_annotation" -- flutter pub run build_runner build
    description: Run build_runner in packages that depend on freezed

  # 串行执行 (避免资源竞争)
  build_runner:serial:
    run: melos exec --concurrency=1 -- flutter pub run build_runner build
    description: Run build_runner one package at a time
```

---

## 4. 包依赖配置

### 4.1 子包 pubspec.yaml 配置

```yaml
# packages/core/pubspec.yaml
name: core
description: Core module - Environment, Theme, Network configurations
version: 1.0.0
publish_to: 'none'           # 不发布到 pub.dev
resolution: workspace        # Dart 3.x workspace 模式

environment:
  sdk: ">=3.10.0-0 <4.0.0"
  flutter: ">=3.38.0"

dependencies:
  flutter:
    sdk: flutter
  # 其他依赖...
```

### 4.2 主应用依赖本地包

```yaml
# apps/main_app/pubspec.yaml
name: main_app
description: Main App - Business code entry point
version: 1.0.0
publish_to: 'none'
resolution: workspace

dependencies:
  flutter:
    sdk: flutter
  # 本地包依赖 (使用相对路径)
  core:
    path: ../../packages/core
  ui_kit:
    path: ../../packages/ui_kit
  router:
    path: ../../packages/router
  infrastructure:
    path: ../../packages/infrastructure
  bridge:
    path: ../../packages/bridge
```

### 4.3 根目录 pubspec.yaml (Workspace 模式)

```yaml
# 根目录 pubspec.yaml
name: flutter_earth_online_workspace
publish_to: 'none'

environment:
  sdk: ">=3.10.0-0 <4.0.0"

# Dart 3.x Workspace 配置
workspace:
  - packages/core
  - packages/ui_kit
  - packages/router
  - packages/infrastructure
  - packages/bridge
  - apps/main_app
```

---

## 5. 常用命令与技巧

### 5.1 日常开发命令

```bash
# 首次克隆项目后
melos bootstrap

# 添加新依赖后
melos pub_get

# 修改 Freezed/Riverpod 注解后
melos build_runner

# 提交代码前
melos analyze

# 清理重建
melos clean && melos bootstrap
```

### 5.2 Melos exec 技巧

```bash
# 在所有包中执行任意命令
melos exec -- <command>

# 只在指定包执行
melos exec --scope="core" -- flutter pub get

# 排除某些包
melos exec --ignore="*_test" -- flutter analyze

# 只在有改动的包执行 (需要 git)
melos exec --since="main" -- flutter test

# 在依赖特定包的所有包中执行
melos exec --depends-on="core" -- flutter pub get
```

### 5.3 调试技巧

```bash
# 查看 Melos 识别到的所有包
melos list

# 查看包依赖关系图
melos list --graph

# 查看详细信息
melos list --long

# 调试模式运行
MELOS_DEBUG=true melos bootstrap
```

---

## 6. 注意事项与最佳实践

### 6.1 版本管理

| 配置项 | 说明 | 推荐值 |
|-------|------|-------|
| `publish_to` | 是否发布到 pub.dev | `'none'` (私有项目) |
| `resolution` | 依赖解析模式 | `workspace` (Dart 3.x) |
| `version` | 包版本 | 保持一致或使用 Melos 版本管理 |

### 6.2 常见问题

**Q1: `melos bootstrap` 报依赖冲突**

```bash
# 解决方案：清理后重新引导
melos clean
flutter pub cache clean
melos bootstrap
```

**Q2: build_runner 生成文件冲突**

```bash
# 使用 --delete-conflicting-outputs 参数
melos exec -- flutter pub run build_runner build --delete-conflicting-outputs
```

**Q3: 本地包修改后不生效**

```bash
# 重新运行 bootstrap 建立链接
melos bootstrap

# 或者只刷新依赖
melos pub_get
```

**Q4: IDE 无法识别本地包**

- 确保已运行 `melos bootstrap`
- 重启 IDE 或重新加载项目
- 检查 `pubspec_overrides.yaml` 是否生成

### 6.3 最佳实践清单

- [ ] **统一导出**: 每个模块使用 `index.dart` 或 `<package_name>.dart` 统一导出
- [ ] **依赖方向**: 保持单向依赖，避免循环依赖
- [ ] **版本一致**: 公共依赖版本保持一致 (如 flutter_riverpod)
- [ ] **代码生成**: 修改注解后立即运行 `melos build_runner`
- [ ] **提交前检查**: 运行 `melos analyze` 和 `melos test`
- [ ] **gitignore**: 添加 `pubspec_overrides.yaml` 到 `.gitignore`

### 6.4 推荐的 .gitignore

```gitignore
# Melos
pubspec_overrides.yaml

# Generated files
*.g.dart
*.freezed.dart
*.gr.dart

# Flutter/Dart
.dart_tool/
.packages
build/
.flutter-plugins
.flutter-plugins-dependencies
```

---

## 附录: 快速参考

### 项目初始化检查清单

1. [ ] 安装 Melos: `dart pub global activate melos`
2. [ ] 创建 `melos.yaml` 配置文件
3. [ ] 创建目录结构: `packages/` 和 `apps/`
4. [ ] 在每个子包创建 `pubspec.yaml`
5. [ ] 运行 `melos bootstrap`
6. [ ] 验证: `melos list` 显示所有包

### 命令速查

| 命令 | 作用 |
|-----|------|
| `melos bootstrap` | 初始化/链接所有包 |
| `melos pub_get` | 获取所有依赖 |
| `melos build_runner` | 运行代码生成 |
| `melos analyze` | 静态分析 |
| `melos test` | 运行测试 |
| `melos clean` | 清理所有包 |
| `melos list` | 列出所有包 |
| `melos exec -- <cmd>` | 在所有包执行命令 |

---

*文档版本: 1.0.0*
*更新日期: 2026-01-10*
*适用环境: Flutter 3.38.0+ / Dart 3.10.0+ / Melos 6.x*
