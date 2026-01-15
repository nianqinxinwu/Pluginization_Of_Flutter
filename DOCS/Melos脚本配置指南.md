# Melos 脚本配置指南

本文档说明在 Flutter Monorepo 项目中如何正确配置 Melos 脚本，特别是与 Dart 3.x Workspace 功能结合使用时的注意事项。

## 背景

- **Melos 版本**: 7.x
- **Dart 版本**: 3.10.0+
- **Flutter 版本**: 3.38.0+

Dart 3.x 引入了原生的 `workspace` 功能，与 Melos 的包管理功能有所重叠。当两者同时使用时，Melos 的配置方式需要调整。

## 配置方式对比

### 方式一：传统 melos.yaml 配置（Melos < 7.x 或不使用 Dart Workspace）

```yaml
# melos.yaml
name: my_project

packages:
  - packages/*
  - apps/*

scripts:
  build_runner:
    run: melos exec -- dart run build_runner build --delete-conflicting-outputs
    description: Run build_runner in all packages
```

### 方式二：pubspec.yaml 配置（Melos 7.x + Dart Workspace）

当项目同时使用 Dart Workspace 和 Melos 7.x 时，脚本需要定义在根目录的 `pubspec.yaml` 中：

```yaml
# pubspec.yaml
name: my_project
version: 1.0.0

environment:
  sdk: ">=3.10.0-0 <4.0.0"
  flutter: ">=3.38.0"

# Dart Workspace 配置
workspace:
  - packages/core
  - packages/ui_kit
  - apps/main_app

dev_dependencies:
  melos: ^7.3.0

# Melos 脚本配置（关键部分）
melos:
  scripts:
    build_runner:
      run: melos exec -- dart run build_runner build --delete-conflicting-outputs
      description: Run build_runner in all packages

    analyze:
      run: melos exec -- flutter analyze
      description: Run flutter analyze in all packages

    test:
      run: melos exec -- flutter test
      description: Run flutter test in all packages
```

## 完整脚本配置示例

```yaml
# 在 pubspec.yaml 中添加
melos:
  scripts:
    # 代码生成
    build_runner:
      run: melos exec -- dart run build_runner build --delete-conflicting-outputs
      description: Run build_runner in all packages

    # 代码生成（监听模式）
    build_runner_watch:
      run: melos exec -- dart run build_runner watch --delete-conflicting-outputs
      description: Run build_runner in watch mode

    # 代码分析
    analyze:
      run: melos exec -- flutter analyze
      description: Run flutter analyze in all packages

    # 运行测试
    test:
      run: melos exec -- flutter test
      description: Run flutter test in all packages

    # 清理项目
    clean:
      run: melos exec -- flutter clean
      description: Run flutter clean in all packages

    # 获取依赖
    pub_get:
      run: melos exec -- flutter pub get
      description: Run flutter pub get in all packages

    # 格式化代码
    format:
      run: melos exec -- dart format .
      description: Format code in all packages

    # 检查格式
    format_check:
      run: melos exec -- dart format --set-exit-if-changed .
      description: Check code formatting in all packages
```

## 命令使用

```bash
# 查看所有可用脚本
melos run

# 运行指定脚本
melos run build_runner
melos run analyze
melos run test
melos run clean
melos run pub_get

# 在特定包中运行
melos exec --scope="main_app" -- dart run build_runner build
```

## 高级配置

### 筛选特定包

```yaml
melos:
  scripts:
    # 只在包含 build_runner 依赖的包中运行
    build_runner:
      run: melos exec -- dart run build_runner build --delete-conflicting-outputs
      packageFilters:
        dependsOn: build_runner
      description: Run build_runner in packages that depend on it

    # 只在 apps 目录下的包中运行
    build_apps:
      run: melos exec -- flutter build apk
      packageFilters:
        dirExists: android
        scope: "*_app"
      description: Build APKs for app packages
```

### 执行顺序控制

```yaml
melos:
  scripts:
    # 串行执行（按依赖顺序）
    build_ordered:
      run: melos exec --concurrency=1 -- dart run build_runner build
      description: Run build_runner sequentially

    # 并行执行（默认）
    build_parallel:
      run: melos exec -- dart run build_runner build
      description: Run build_runner in parallel
```

### 失败处理

```yaml
melos:
  scripts:
    # 即使某个包失败也继续执行其他包
    test_all:
      run: melos exec --fail-fast=false -- flutter test
      description: Run tests in all packages, continue on failure
```

## 常见问题

### 1. NoScriptException 错误

**错误信息**:
```
NoScriptException: This workspace has no scripts defined in its 'pubspec.yaml' file.
```

**解决方案**: 将脚本从 `melos.yaml` 移动到 `pubspec.yaml` 的 `melos:` 节点下。

### 2. melos.yaml 和 pubspec.yaml 同时存在

当两个文件都存在时：
- `melos.yaml` 用于定义 `packages` 路径和 `command` 配置
- `pubspec.yaml` 用于定义 `scripts` 和 `workspace`

推荐做法是将所有配置统一到 `pubspec.yaml` 中。

### 3. SDK 版本警告

**警告信息**:
```
SDK language version 3.10.0 is newer than `analyzer` language version 3.9.0
```

**说明**: 这是因为使用的 SDK 版本较新，analyzer 包尚未更新。通常不影响代码生成，可以忽略。

## 项目结构参考

```
/my_project
├── pubspec.yaml          # 包含 workspace + melos scripts
├── melos.yaml            # 可选，用于额外配置
├── packages/
│   ├── core/
│   │   └── pubspec.yaml  # resolution: workspace
│   └── ui_kit/
│       └── pubspec.yaml  # resolution: workspace
└── apps/
    └── main_app/
        └── pubspec.yaml  # resolution: workspace
```

子包的 `pubspec.yaml` 需要添加：

```yaml
resolution: workspace
```

## 总结

| 场景 | 脚本配置位置 |
|------|-------------|
| Melos < 7.x | melos.yaml |
| Melos 7.x + 无 Dart Workspace | melos.yaml |
| Melos 7.x + Dart Workspace | pubspec.yaml 的 melos: 节点 |

使用 Dart Workspace 时，推荐将 Melos 脚本配置在根目录 `pubspec.yaml` 的 `melos:` 节点下，以确保兼容性。
