# Flutter Earth Online 开发技能规范

本技能集为 Claude Code 提供 Flutter Earth Online 项目的标准化开发规范，确保代码一致性和质量。

---

## 技能索引

| 技能文件 | 用途 |
|---------|------|
| [flutter-ui-kit.md](./flutter-ui-kit.md) | 基础 UI 组件使用规范 |
| [flutter-utils.md](./flutter-utils.md) | 基础工具使用规范 |
| [flutter-network.md](./flutter-network.md) | 网络请求使用规范 |
| [flutter-page.md](./flutter-page.md) | 页面开发规范 |

---

## 核心开发规则

### 1. 项目结构规范

```
/packages/
├── core/           # 基础能力（禁止业务代码）
├── ui_kit/         # 通用UI组件（禁止业务代码）
├── router/         # 路由配置
├── infrastructure/ # 基础设施（日志、监控）
└── bridge/         # 平台通道

/apps/main_app/     # 业务代码入口
```

### 2. 导入规范

**必须使用包导入，禁止相对路径导入：**

```dart
// 正确
import 'package:core/core.dart';
import 'package:ui_kit/ui_kit.dart';

// 错误
import '../../../packages/core/lib/core.dart';
```

**统一通过 index.dart 导出：**

```dart
// 正确 - 使用统一导出
import 'package:ui_kit/ui_kit.dart';

// 错误 - 直接导入内部文件
import 'package:ui_kit/src/buttons/app_button.dart';
```

### 3. 组件开发规范

#### 3.1 使用 ui_kit 组件而非原生组件

```dart
// 正确 - 使用封装组件
AppButton.primary(
  onPressed: () {},
  child: AppText.button('提交'),
)

// 错误 - 直接使用原生组件
ElevatedButton(
  onPressed: () {},
  child: Text('提交'),
)
```

#### 3.2 多形态组件使用 Factory Constructors

```dart
// 正确
class AppButton extends StatelessWidget {
  factory AppButton.primary(...) => AppButton._(...);
  factory AppButton.secondary(...) => AppButton._(...);
  factory AppButton.text(...) => AppButton._(...);
}

// 错误
class PrimaryButton extends StatelessWidget { ... }
class SecondaryButton extends StatelessWidget { ... }
```

#### 3.3 AppBar 必须实现 PreferredSizeWidget

```dart
// 正确
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
```

### 4. 状态管理规范

#### 4.1 使用 Riverpod + Generator

```dart
// 正确 - 使用 @riverpod 注解
@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  User build() => User.empty();
}

// 错误 - 手动创建 Provider
final userProvider = StateNotifierProvider<UserNotifier, User>(...);
```

#### 4.2 Provider 文件位置

```
/packages/模块名/lib/src/providers/
├── index.dart
├── user_provider.dart
└── auth_provider.dart
```

### 5. 数据模型规范

#### 5.1 网络模型强制使用 Freezed

```dart
// 正确
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    String? email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// 错误
class User {
  final String id;
  final String name;
  User({required this.id, required this.name});
}
```

### 6. 屏幕适配规范

#### 6.1 使用 ScreenExtension 进行适配

```dart
// 正确 - 使用适配扩展
Container(
  width: 100.w,
  height: 50.h,
  padding: 16.paddingAll,
  child: AppText.body1('内容', fontSize: 14.sp),
)

// 错误 - 硬编码数值
Container(
  width: 100,
  height: 50,
  padding: EdgeInsets.all(16),
)
```

#### 6.2 使用预设间距

```dart
// 正确 - 使用预设间距
Column(
  children: [
    widget1,
    Gap.v16,  // 垂直间距 16
    widget2,
    Gap.v8,   // 垂直间距 8
    widget3,
  ],
)

// 错误
Column(
  children: [
    widget1,
    SizedBox(height: 16),
    widget2,
  ],
)
```

### 7. 网络请求规范

#### 7.1 使用 DioClient 而非原生 Dio

```dart
// 正确
final client = DioClient();
final response = await client.get<Map<String, dynamic>>('/users');

// 错误
final dio = Dio();
final response = await dio.get('/users');
```

#### 7.2 敏感数据必须加密传输

```dart
// 正确 - 敏感数据使用加密请求
final response = await client.postEncrypted<Map<String, dynamic>>(
  '/auth/login',
  data: {'password': password},
  encryptConfig: EncryptConfig.full,
);

// 错误 - 明文传输敏感数据
final response = await client.post('/auth/login', data: {'password': password});
```

### 8. 路由规范

#### 8.1 使用 AutoRouter

```dart
// 正确 - 使用 AutoRouter
context.router.push(const SettingsRoute());
context.router.pushNamed('/settings');

// 错误 - 使用原生 Navigator
Navigator.push(context, MaterialPageRoute(...));
```

#### 8.2 路由包装器模式

```dart
// 在 main_app 中使用 Wrapper 后缀避免命名冲突
@RoutePage()
class SettingsWrapperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const main_feature.SettingsPage();
  }
}
```

### 9. 禁止事项

| 禁止行为 | 替代方案 |
|---------|---------|
| 使用 mixin 返回 Widget | 使用组合模式或 Factory |
| 在 core/ui_kit 中写业务代码 | 放入 main_app 或 feature 模块 |
| 使用原生 Text/Button 等组件 | 使用 AppText/AppButton |
| 手动创建 Riverpod Provider | 使用 @riverpod 注解 |
| 网络模型不使用 Freezed | 强制使用 Freezed |
| 硬编码尺寸数值 | 使用 ScreenExtension |
| 相对路径导入 | 使用包导入 |

### 10. 代码生成

修改 Freezed/Riverpod/AutoRouter 相关代码后，必须运行：

```bash
melos build_runner
```

---

## 快速参考

### 常用导入

```dart
// 核心能力
import 'package:core/core.dart';

// UI 组件
import 'package:ui_kit/ui_kit.dart';

// 路由
import 'package:router/router.dart';

// 基础设施
import 'package:infrastructure/infrastructure.dart';

// Riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Freezed
import 'package:freezed_annotation/freezed_annotation.dart';
```

### 新建页面检查清单

- [ ] 使用 `@RoutePage()` 注解
- [ ] 继承 `ConsumerWidget` 或 `ConsumerStatefulWidget`
- [ ] 使用 `AppAppBar` 而非原生 `AppBar`
- [ ] 使用 `AppText`/`AppButton` 等封装组件
- [ ] 使用 `.w`/`.h`/`.sp` 进行尺寸适配
- [ ] 在 router 中注册路由
- [ ] 运行 `melos build_runner`

### 新建网络请求检查清单

- [ ] 使用 `DioClient` 发起请求
- [ ] 敏感数据使用加密方法
- [ ] 返回类型使用 Freezed 模型
- [ ] 通过 AsyncValue 暴露给 UI
- [ ] 错误处理使用 try-catch

---

## 详细文档

请参阅各技能文件获取详细使用说明：

- **UI 组件**: [flutter-ui-kit.md](./flutter-ui-kit.md)
- **工具函数**: [flutter-utils.md](./flutter-utils.md)
- **网络请求**: [flutter-network.md](./flutter-network.md)
- **页面开发**: [flutter-page.md](./flutter-page.md)
