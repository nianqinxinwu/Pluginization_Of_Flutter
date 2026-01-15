# Flutter 页面开发规范

本技能文件定义页面开发的标准结构和最佳实践。

---

## 项目结构

### 主应用结构

```
/apps/main_app/lib/src/
├── index.dart          # 主导出文件
├── bootstrap.dart      # 应用初始化
├── router/             # 路由配置
│   ├── index.dart
│   ├── app_router.dart
│   └── app_router.gr.dart
├── providers/          # Riverpod 状态管理
│   └── index.dart
├── models/             # Freezed 数据模型
│   └── index.dart
├── services/           # API 服务层
│   └── index.dart
├── data/               # 数据仓库层
│   └── index.dart
├── ui/                 # 应用级 UI 组件
│   └── index.dart
└── features/           # 轻量级特性模块
    └── index.dart
```

### Feature 模块结构

```
/packages/features/xxx_feature/lib/src/
├── index.dart          # 模块导出
├── pages/              # 页面
│   ├── index.dart
│   └── xxx_page.dart
├── widgets/            # 页面专用组件
│   └── index.dart
├── providers/          # 模块状态管理
│   └── index.dart
├── models/             # 模块数据模型
│   └── index.dart
└── services/           # 模块 API 服务
    └── index.dart
```

---

## 页面创建规范

### 1. 基础页面模板

```dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:core/core.dart';

@RoutePage()
class ExamplePage extends ConsumerWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppAppBar(
        title: '页面标题',
        leading: AppIconButton(
          icon: Icons.arrow_back,
          onPressed: () => context.router.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: 16.paddingH,
          child: Column(
            children: [
              // 页面内容
            ],
          ),
        ),
      ),
    );
  }
}
```

### 2. StatefulWidget 页面模板

```dart
@RoutePage()
class ExamplePage extends ConsumerStatefulWidget {
  const ExamplePage({super.key});

  @override
  ConsumerState<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends ConsumerState<ExamplePage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 初始化逻辑
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: '页面标题'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: 16.paddingAll,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInputSection(),
              Gap.v24,
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputSection() {
    return AppTextField(
      controller: _controller,
      labelText: '输入框',
      validator: Validators.required(),
    );
  }

  Widget _buildSubmitButton() {
    return AppButton.primary(
      onPressed: _handleSubmit,
      isFullWidth: true,
      child: AppText.button('提交'),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      // 处理提交
    }
  }
}
```

### 3. 带异步数据的页面

```dart
@RoutePage()
class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);

    return Scaffold(
      appBar: AppAppBar(title: '用户列表'),
      body: usersAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => AppErrorWidget(
          title: '加载失败',
          description: error.toString(),
          onAction: () => ref.invalidate(usersProvider),
          actionText: '重试',
        ),
        data: (users) {
          if (users.isEmpty) {
            return AppEmptyWidget(
              title: '暂无用户',
              description: '当前没有任何用户数据',
            );
          }
          return _buildUserList(users);
        },
      ),
    );
  }

  Widget _buildUserList(List<User> users) {
    return ListView.separated(
      padding: 16.paddingAll,
      itemCount: users.length,
      separatorBuilder: (_, __) => Gap.v8,
      itemBuilder: (context, index) {
        final user = users[index];
        return _UserListItem(user: user);
      },
    );
  }
}
```

---

## 路由配置

### 1. 路由定义

```dart
// app_router.dart
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // 主页
    AutoRoute(
      path: '/',
      page: MainWrapperRoute.page,
      initial: true,
    ),
    // 设置页
    AutoRoute(
      path: '/settings',
      page: SettingsWrapperRoute.page,
    ),
    // 用户详情页（带参数）
    AutoRoute(
      path: '/user/:id',
      page: UserDetailRoute.page,
    ),
    // 嵌套路由
    AutoRoute(
      path: '/tabs',
      page: TabsWrapperRoute.page,
      children: [
        AutoRoute(path: 'home', page: HomeRoute.page),
        AutoRoute(path: 'profile', page: ProfileRoute.page),
      ],
    ),
  ];
}
```

### 2. 路由包装器

```dart
// 包装器页面（避免命名冲突）
@RoutePage()
class SettingsWrapperScreen extends StatelessWidget {
  const SettingsWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const settings_feature.SettingsPage();
  }
}
```

### 3. 页面导航

```dart
// 基础导航
context.router.push(const SettingsRoute());

// 带参数导航
context.router.push(UserDetailRoute(id: '123'));

// 命名路由导航
context.router.pushNamed('/settings');

// 替换当前页面
context.router.replace(const HomeRoute());

// 返回上一页
context.router.pop();

// 返回到指定页面
context.router.popUntil((route) => route.name == HomeRoute.name);

// 清空栈并导航
context.router.replaceAll([const HomeRoute()]);
```

### 4. 路由参数

```dart
// 定义带参数的页面
@RoutePage()
class UserDetailPage extends ConsumerWidget {
  const UserDetailPage({
    super.key,
    @PathParam('id') required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppAppBar(title: '用户详情'),
      body: Center(
        child: AppText.body1('用户ID: $userId'),
      ),
    );
  }
}

// 导航时传递参数
context.router.push(UserDetailRoute(userId: '123'));
```

### 5. 路由守卫

```dart
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isLoggedIn = // 检查登录状态

    if (isLoggedIn) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}

// 在路由中使用
AutoRoute(
  path: '/profile',
  page: ProfileRoute.page,
  guards: [AuthGuard()],
)
```

---

## 状态管理

### 1. Provider 定义

```dart
// 使用 @riverpod 注解
part 'user_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  User build() {
    return User.empty();
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  Future<void> fetchUser(String id) async {
    state = await ref.read(userServiceProvider).getUser(id);
  }
}
```

### 2. 异步 Provider

```dart
@riverpod
Future<List<User>> users(Ref ref) async {
  final service = ref.read(userServiceProvider);
  return service.getUsers();
}
```

### 3. 在页面中使用

```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  // 监听状态
  final user = ref.watch(userNotifierProvider);

  // 读取状态（不监听变化）
  final service = ref.read(userServiceProvider);

  // 监听异步状态
  final usersAsync = ref.watch(usersProvider);

  return usersAsync.when(
    loading: () => CircularProgressIndicator(),
    error: (e, s) => AppErrorWidget(title: e.toString()),
    data: (users) => _buildList(users),
  );
}
```

### 4. 触发状态更新

```dart
// 调用 Notifier 方法
ref.read(userNotifierProvider.notifier).updateName('新名字');

// 刷新异步 Provider
ref.invalidate(usersProvider);

// 重新获取数据
ref.refresh(usersProvider);
```

---

## 数据模型

### 1. Freezed 模型定义

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    String? email,
    @Default(false) bool isActive,
    DateTime? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // 空对象工厂
  factory User.empty() => const User(id: '', name: '');
}
```

### 2. 枚举序列化

```dart
@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required OrderStatus status,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

enum OrderStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}
```

### 3. 嵌套模型

```dart
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required User user,
    required List<Address> addresses,
    Settings? settings,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
```

---

## 服务层

### 1. API 服务定义

```dart
class UserService {
  final DioClient _client;

  UserService(this._client);

  Future<User> getUser(String id) async {
    final response = await _client.get<Map<String, dynamic>>('/users/$id');
    return User.fromJson(response.data!);
  }

  Future<List<User>> getUsers() async {
    final response = await _client.get<List<dynamic>>('/users');
    return response.data!.map((e) => User.fromJson(e)).toList();
  }

  Future<User> createUser(User user) async {
    final response = await _client.post<Map<String, dynamic>>(
      '/users',
      data: user.toJson(),
    );
    return User.fromJson(response.data!);
  }

  Future<void> deleteUser(String id) async {
    await _client.delete('/users/$id');
  }
}
```

### 2. 服务 Provider

```dart
@riverpod
UserService userService(Ref ref) {
  return UserService(DioClient());
}
```

---

## 页面组织规则

### 1. 文件命名

```
pages/
├── user_list_page.dart      # 页面文件：xxx_page.dart
├── user_detail_page.dart
└── user_edit_page.dart

widgets/
├── user_list_item.dart      # 组件文件：xxx_item.dart / xxx_widget.dart
├── user_avatar_widget.dart
└── user_form_widget.dart
```

### 2. 导出规范

每个目录必须有 `index.dart` 统一导出：

```dart
// pages/index.dart
export 'user_list_page.dart';
export 'user_detail_page.dart';
export 'user_edit_page.dart';
```

### 3. 代码组织

```dart
class ExamplePage extends ConsumerWidget {
  // 1. 构造函数和属性
  const ExamplePage({super.key, required this.id});
  final String id;

  // 2. build 方法
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(...);
  }

  // 3. 构建方法（以 _build 开头）
  Widget _buildHeader() { ... }
  Widget _buildContent() { ... }
  Widget _buildFooter() { ... }

  // 4. 事件处理方法（以 _handle 开头）
  void _handleSubmit() { ... }
  void _handleRefresh() { ... }
}
```

---

## 代码生成

修改 Freezed/Riverpod/AutoRouter 相关代码后，运行：

```bash
# 全量生成
melos build_runner

# 或在指定包中运行
cd packages/features/xxx_feature
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 检查清单

### 新建页面

- [ ] 使用 `@RoutePage()` 注解
- [ ] 继承 `ConsumerWidget` 或 `ConsumerStatefulWidget`
- [ ] 使用 `AppAppBar` 而非原生 `AppBar`
- [ ] 使用封装组件 (`AppText`, `AppButton` 等)
- [ ] 使用屏幕适配 (`.w`, `.h`, `.sp`)
- [ ] 在 router 中注册路由
- [ ] 添加到 index.dart 导出
- [ ] 运行 `melos build_runner`

### 新建数据模型

- [ ] 使用 `@freezed` 注解
- [ ] 添加 `part 'xxx.freezed.dart'`
- [ ] 添加 `part 'xxx.g.dart'`
- [ ] 实现 `fromJson` 工厂方法
- [ ] 添加到 index.dart 导出
- [ ] 运行 `melos build_runner`

### 新建 Provider

- [ ] 使用 `@riverpod` 注解
- [ ] 添加 `part 'xxx.g.dart'`
- [ ] 添加到 index.dart 导出
- [ ] 运行 `melos build_runner`
