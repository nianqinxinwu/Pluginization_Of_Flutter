# Flutter UI Kit 组件使用规范

本技能文件定义 `packages/ui_kit` 中 UI 组件的标准使用方式。

---

## 导入方式

```dart
import 'package:ui_kit/ui_kit.dart';
```

---

## 按钮组件 (Buttons)

### AppButton - 主按钮组件

使用 Factory Constructors 创建不同类型的按钮：

```dart
// 主要按钮（填充样式）
AppButton.primary(
  onPressed: () => handleSubmit(),
  child: AppText.button('提交'),
)

// 次要按钮（边框样式）
AppButton.secondary(
  onPressed: () => handleCancel(),
  child: AppText.button('取消'),
)

// 文本按钮
AppButton.text(
  onPressed: () => handleMore(),
  child: AppText.button('更多'),
)

// 图标按钮
AppButton.icon(
  onPressed: () => handleFavorite(),
  icon: Icons.favorite,
)

// 填充按钮
AppButton.filled(
  onPressed: () {},
  child: AppText.button('确定'),
  backgroundColor: Colors.green,
)

// 边框按钮
AppButton.outlined(
  onPressed: () {},
  child: AppText.button('取消'),
  borderColor: Colors.grey,
)
```

### 按钮尺寸

```dart
// 小尺寸 (32px)
AppButton.primary(
  size: ButtonSize.small,
  onPressed: () {},
  child: AppText.button('小按钮'),
)

// 中等尺寸 (44px) - 默认
AppButton.primary(
  size: ButtonSize.medium,
  onPressed: () {},
  child: AppText.button('中按钮'),
)

// 大尺寸 (50px)
AppButton.primary(
  size: ButtonSize.large,
  onPressed: () {},
  child: AppText.button('大按钮'),
)
```

### 按钮状态

```dart
// 加载状态
AppButton.primary(
  onPressed: () {},
  isLoading: true,
  child: AppText.button('加载中'),
)

// 禁用状态
AppButton.primary(
  onPressed: null, // 或 isEnabled: false
  child: AppText.button('禁用'),
)

// 全宽按钮
AppButton.primary(
  onPressed: () {},
  isFullWidth: true,
  child: AppText.button('全宽按钮'),
)
```

### 其他按钮组件

```dart
// 文本按钮
AppTextButton(
  onPressed: () {},
  text: '文本按钮',
)

// 图标按钮
AppIconButton(
  onPressed: () {},
  icon: Icons.settings,
  size: IconButtonSize.medium,
)

// 链接按钮
AppLinkButton(
  onPressed: () {},
  text: '链接文本',
)
```

---

## 文本组件 (Text)

### AppText - 预设文本样式

```dart
// 标题样式
AppText.title1('大标题')     // 24px, bold
AppText.title2('中标题')     // 20px, w600
AppText.title3('小标题')     // 17px, w600

// 正文样式
AppText.body1('正文大')      // 16px
AppText.body2('正文中')      // 14px
AppText.body3('正文小')      // 12px

// 特殊样式
AppText.button('按钮文字')   // 16px, w600
AppText.label('标签')        // 12px, w500
AppText.hint('提示文字')     // 12px, 灰色
AppText.navigation('导航')   // 17px, w600
```

### 自定义属性

```dart
AppText.body1(
  '自定义文本',
  color: Colors.blue,
  fontSize: 18,
  fontWeight: FontWeight.bold,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
  textAlign: TextAlign.center,
)
```

---

## 输入框组件 (TextForm)

### AppTextField / AppInput

```dart
// 基础输入框
AppTextField(
  controller: _controller,
  labelText: '用户名',
  hintText: '请输入用户名',
)

// 边框样式
AppTextField.outlined(
  controller: _controller,
  labelText: '邮箱',
  prefixIcon: Icons.email,
)

// 填充样式
AppTextField.filled(
  controller: _controller,
  labelText: '备注',
)

// 搜索框
AppTextField.search(
  controller: _controller,
  hintText: '搜索...',
  onSubmitted: (value) => handleSearch(value),
)
```

### 密码输入

```dart
AppTextField(
  controller: _passwordController,
  labelText: '密码',
  obscureText: true,
  enablePasswordToggle: true, // 显示/隐藏密码切换
)
```

### 表单验证

```dart
AppTextField(
  controller: _controller,
  labelText: '手机号',
  keyboardType: TextInputType.phone,
  validator: Validators.phone(),
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(11),
  ],
)
```

---

## 对话框组件 (Dialogs)

### AppAlertDialog - 警告弹窗

```dart
// 显示警告弹窗
await AppAlertDialog.show(
  context: context,
  title: '提示',
  content: '操作已完成',
  confirmText: '确定',
);
```

### AppConfirmDialog - 确认弹窗

```dart
// 显示确认弹窗
final confirmed = await AppConfirmDialog.show(
  context: context,
  title: '确认删除',
  content: '确定要删除这条记录吗？',
  confirmText: '删除',
  cancelText: '取消',
  isDestructive: true, // 红色确认按钮
);

if (confirmed == true) {
  // 执行删除
}
```

### AppLoadingDialog - 加载弹窗

```dart
// 显示加载弹窗
AppLoadingDialog.show(context: context, message: '加载中...');

// 执行异步操作
await someAsyncOperation();

// 关闭加载弹窗
AppLoadingDialog.hide(context);
```

---

## 布局组件 (Layout)

### AppAppBar - 自定义导航栏

```dart
Scaffold(
  appBar: AppAppBar(
    title: '页面标题',
    leading: AppIconButton(
      icon: Icons.arrow_back,
      onPressed: () => context.router.pop(),
    ),
    actions: [
      AppIconButton(
        icon: Icons.more_vert,
        onPressed: () => showOptions(),
      ),
    ],
  ),
  body: ...,
)

// 透明导航栏
AppAppBar.transparent(
  title: '透明导航',
)

// 带搜索框的导航栏
AppAppBar.search(
  hintText: '搜索...',
  onSearch: (value) => handleSearch(value),
)
```

### AppCard - 卡片组件

```dart
AppCard(
  child: Column(
    children: [
      AppText.title3('卡片标题'),
      Gap.v8,
      AppText.body2('卡片内容'),
    ],
  ),
  padding: 16.paddingAll,
  margin: 8.paddingAll,
  borderRadius: 12.r,
  elevation: 2,
  onTap: () => handleCardTap(),
)
```

### AppListTile - 列表项

```dart
AppListTile(
  leading: AppIcon(Icons.person),
  title: AppText.body1('用户名'),
  subtitle: AppText.body3('user@example.com'),
  trailing: AppIcon(Icons.chevron_right),
  onTap: () => navigateToProfile(),
)
```

### AppBottomSheet - 底部弹出框

```dart
AppBottomSheet.show(
  context: context,
  builder: (context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      AppListTile(
        leading: AppIcon(Icons.camera),
        title: AppText.body1('拍照'),
        onTap: () => takePhoto(),
      ),
      AppListTile(
        leading: AppIcon(Icons.photo_library),
        title: AppText.body1('从相册选择'),
        onTap: () => pickFromGallery(),
      ),
    ],
  ),
);
```

### 空状态和错误状态

```dart
// 空状态
AppEmptyWidget(
  icon: Icons.inbox,
  title: '暂无数据',
  description: '当前没有任何记录',
  actionText: '刷新',
  onAction: () => refresh(),
)

// 错误状态
AppErrorWidget(
  icon: Icons.error_outline,
  title: '加载失败',
  description: '网络连接异常，请重试',
  actionText: '重试',
  onAction: () => retry(),
)
```

### AppDivider - 分隔线

```dart
// 水平分隔线
AppDivider()

// 带缩进的分隔线
AppDivider(indent: 16, endIndent: 16)

// 垂直分隔线
AppDivider.vertical(height: 20)
```

---

## 图片组件 (Images)

### AppImage - 统一图片组件

```dart
// 网络图片
AppImage.network(
  'https://example.com/image.jpg',
  width: 100.w,
  height: 100.h,
  fit: BoxFit.cover,
  placeholder: CircularProgressIndicator(),
  errorWidget: Icon(Icons.broken_image),
)

// 本地资源图片
AppImage.asset(
  'assets/images/logo.png',
  width: 50.w,
  height: 50.h,
)

// 文件图片
AppImage.file(
  File('/path/to/image.jpg'),
  width: 200.w,
  height: 200.h,
)

// 圆形头像
AppImage.avatar(
  'https://example.com/avatar.jpg',
  radius: 30.r,
  placeholder: Icon(Icons.person),
)
```

### 圆角图片

```dart
AppImage.network(
  url,
  width: 100.w,
  height: 100.h,
  borderRadius: BorderRadius.circular(8.r),
)
```

### AppIcon - 图标组件

```dart
// 基础图标
AppIcon(Icons.home)

// 指定尺寸
AppIcon(
  Icons.settings,
  size: IconSize.large,  // small(16), medium(24), large(32)
)

// 自定义颜色和尺寸
AppIcon(
  Icons.favorite,
  color: Colors.red,
  size: 28,
)
```

---

## 组件使用规则

### 1. 必须使用封装组件

```dart
// ✅ 正确
AppButton.primary(onPressed: () {}, child: AppText.button('提交'))
AppText.body1('内容')
AppTextField(controller: _controller)

// ❌ 错误
ElevatedButton(onPressed: () {}, child: Text('提交'))
Text('内容')
TextField(controller: _controller)
```

### 2. 尺寸必须使用适配

```dart
// ✅ 正确
Container(
  width: 100.w,
  height: 50.h,
  padding: 16.paddingAll,
)

// ❌ 错误
Container(
  width: 100,
  height: 50,
  padding: EdgeInsets.all(16),
)
```

### 3. 间距使用 Gap 预设

```dart
// ✅ 正确
Column(
  children: [
    widget1,
    Gap.v16,
    widget2,
  ],
)

// ❌ 错误
Column(
  children: [
    widget1,
    SizedBox(height: 16),
    widget2,
  ],
)
```

### 4. AppBar 必须使用 AppAppBar

```dart
// ✅ 正确
Scaffold(
  appBar: AppAppBar(title: '标题'),
)

// ❌ 错误
Scaffold(
  appBar: AppBar(title: Text('标题')),
)
```

---

## 组件速查表

| 原生组件 | 封装组件 | 说明 |
|---------|---------|------|
| `Text` | `AppText.body1()` | 文本 |
| `ElevatedButton` | `AppButton.primary()` | 主按钮 |
| `OutlinedButton` | `AppButton.secondary()` | 次按钮 |
| `TextButton` | `AppButton.text()` | 文本按钮 |
| `IconButton` | `AppIconButton()` | 图标按钮 |
| `TextField` | `AppTextField()` | 输入框 |
| `AppBar` | `AppAppBar()` | 导航栏 |
| `Card` | `AppCard()` | 卡片 |
| `ListTile` | `AppListTile()` | 列表项 |
| `AlertDialog` | `AppAlertDialog` | 警告弹窗 |
| `Image.network` | `AppImage.network()` | 网络图片 |
| `Icon` | `AppIcon()` | 图标 |
| `Divider` | `AppDivider()` | 分隔线 |
| `SizedBox` | `Gap.v16` / `Gap.h16` | 间距 |
