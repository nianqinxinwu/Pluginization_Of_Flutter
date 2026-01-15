# Flutter 基础工具使用规范

本技能文件定义 `packages/core` 中工具模块的标准使用方式。

---

## 导入方式

```dart
import 'package:core/core.dart';
```

---

## 屏幕适配 (ScreenUtil & ScreenExtension)

### 初始化配置

在 `MaterialApp` 中初始化：

```dart
MaterialApp(
  builder: (context, child) {
    // 使用预设配置
    ScreenUtil.init(
      context,
      designConfig: DesignConfig.iPhone16Pro,
    );
    return child!;
  },
)
```

### 预设设计稿配置

```dart
// iOS 设备
DesignConfig.iPhoneSE        // 320 x 568
DesignConfig.iPhoneX         // 375 x 812
DesignConfig.iPhonePro       // 390 x 844
DesignConfig.iPhoneProMax    // 428 x 926
DesignConfig.iPhone16Pro     // 402 x 874 (推荐)

// Android 设备
DesignConfig.androidSmall    // 360 x 640
DesignConfig.android         // 360 x 800
DesignConfig.androidLarge    // 412 x 915
DesignConfig.androidFull     // 412 x 892

// 平板设备
DesignConfig.iPadMini        // 768 x 1024
DesignConfig.iPad            // 810 x 1080
DesignConfig.iPadPro11       // 834 x 1194
DesignConfig.iPadPro129      // 1024 x 1366
```

### 尺寸适配扩展

```dart
// 宽度适配
100.w    // 按设计稿宽度比例适配

// 高度适配
50.h     // 按设计稿高度比例适配

// 字体适配
14.sp    // 按比例适配字体大小

// 圆角适配
8.r      // 按比例适配圆角
```

### 间距快捷方式

```dart
// SizedBox 快捷创建
16.horizontalSpace   // SizedBox(width: 16.w)
16.verticalSpace     // SizedBox(height: 16.h)
16.hGap              // 同 horizontalSpace
16.vGap              // 同 verticalSpace
```

### EdgeInsets 快捷方式

```dart
// 全方向
16.paddingAll        // EdgeInsets.all(16.w)
16.marginAll         // 同上

// 水平/垂直
16.paddingH          // EdgeInsets.symmetric(horizontal: 16.w)
16.paddingV          // EdgeInsets.symmetric(vertical: 16.h)

// 单方向
16.paddingLeft       // EdgeInsets.only(left: 16.w)
16.paddingRight      // EdgeInsets.only(right: 16.w)
16.paddingTop        // EdgeInsets.only(top: 16.h)
16.paddingBottom     // EdgeInsets.only(bottom: 16.h)
```

### BorderRadius 快捷方式

```dart
// 全圆角
8.borderRadiusAll    // BorderRadius.circular(8.r)

// 方向圆角
8.borderRadiusTop    // BorderRadius.vertical(top: Radius.circular(8.r))
8.borderRadiusBottom // BorderRadius.vertical(bottom: Radius.circular(8.r))
8.borderRadiusLeft   // BorderRadius.horizontal(left: Radius.circular(8.r))
8.borderRadiusRight  // BorderRadius.horizontal(right: Radius.circular(8.r))
```

### 预设间距 Gap

```dart
// 水平间距
Gap.h4   // SizedBox(width: 4.w)
Gap.h8   // SizedBox(width: 8.w)
Gap.h12  // SizedBox(width: 12.w)
Gap.h16  // SizedBox(width: 16.w)
Gap.h20  // SizedBox(width: 20.w)
Gap.h24  // SizedBox(width: 24.w)
Gap.h32  // SizedBox(width: 32.w)

// 垂直间距
Gap.v4   // SizedBox(height: 4.h)
Gap.v8   // SizedBox(height: 8.h)
Gap.v12  // SizedBox(height: 12.h)
Gap.v16  // SizedBox(height: 16.h)
Gap.v20  // SizedBox(height: 20.h)
Gap.v24  // SizedBox(height: 24.h)
Gap.v32  // SizedBox(height: 32.h)
```

### 使用示例

```dart
Container(
  width: 200.w,
  height: 100.h,
  padding: 16.paddingAll,
  margin: 8.paddingH,
  decoration: BoxDecoration(
    borderRadius: 12.borderRadiusAll,
  ),
  child: Column(
    children: [
      AppText.title2('标题', fontSize: 18.sp),
      Gap.v8,
      AppText.body1('内容'),
    ],
  ),
)
```

---

## 数据存储 (Storage)

### 初始化

在应用启动时初始化：

```dart
await Storage.instance.init();
```

### 基本类型存取

```dart
final storage = Storage.instance;

// String
await storage.setString('username', '张三');
final username = storage.getString('username');

// Bool
await storage.setBool('isLoggedIn', true);
final isLoggedIn = storage.getBool('isLoggedIn');

// Int
await storage.setInt('count', 100);
final count = storage.getInt('count');

// Double
await storage.setDouble('price', 99.9);
final price = storage.getDouble('price');

// StringList
await storage.setStringList('tags', ['flutter', 'dart']);
final tags = storage.getStringList('tags');
```

### JSON 数据存取

```dart
// 存储 JSON 对象
await storage.setJson('user', {
  'id': 1,
  'name': '张三',
  'email': 'zhangsan@example.com',
});

// 读取 JSON 对象
final user = storage.getJson('user');

// 存储 JSON 列表
await storage.setJsonList('users', [
  {'id': 1, 'name': '张三'},
  {'id': 2, 'name': '李四'},
]);

// 读取 JSON 列表
final users = storage.getJsonList('users');
```

### 删除和清空

```dart
// 删除指定 key
await storage.remove('username');

// 清空所有数据
await storage.clear();

// 检查 key 是否存在
final exists = storage.containsKey('username');
```

### 存储键常量（推荐）

```dart
// 定义存储键常量
class StorageKeys {
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String user = 'user';
  static const String isFirstLaunch = 'is_first_launch';
}

// 使用
await storage.setString(StorageKeys.accessToken, token);
```

---

## 表单验证 (Validators)

### 基础验证器

```dart
// 必填验证
AppTextField(
  validator: Validators.required(message: '请输入用户名'),
)

// 长度验证
AppTextField(
  validator: Validators.minLength(6, message: '最少6个字符'),
)

AppTextField(
  validator: Validators.maxLength(20, message: '最多20个字符'),
)

AppTextField(
  validator: Validators.lengthRange(6, 20, message: '长度需在6-20之间'),
)
```

### 格式验证

```dart
// 邮箱验证
AppTextField(
  validator: Validators.email(message: '请输入有效的邮箱'),
)

// 手机号验证（中国）
AppTextField(
  validator: Validators.phone(message: '请输入有效的手机号'),
)

// 数字验证
AppTextField(
  validator: Validators.numeric(message: '请输入数字'),
)

// 整数验证
AppTextField(
  validator: Validators.integer(message: '请输入整数'),
)

// URL 验证
AppTextField(
  validator: Validators.url(message: '请输入有效的URL'),
)
```

### 密码验证

```dart
// 密码长度验证
AppTextField(
  validator: Validators.password(
    minLength: 8,
    maxLength: 20,
    message: '密码长度需在8-20之间',
  ),
)

// 确认密码验证
AppTextField(
  validator: Validators.confirmPassword(
    _passwordController,
    message: '两次密码输入不一致',
  ),
)
```

### 正则验证

```dart
// 自定义正则
AppTextField(
  validator: Validators.pattern(
    r'^[a-zA-Z0-9_]+$',
    message: '只能包含字母、数字和下划线',
  ),
)
```

### 组合验证

```dart
// 组合多个验证器
AppTextField(
  validator: Validators.compose([
    Validators.required(message: '请输入用户名'),
    Validators.minLength(4, message: '最少4个字符'),
    Validators.maxLength(20, message: '最多20个字符'),
    Validators.pattern(r'^[a-zA-Z0-9_]+$', message: '只能包含字母数字下划线'),
  ]),
)
```

### 自定义验证

```dart
AppTextField(
  validator: Validators.custom((value) {
    if (value == null || value.isEmpty) {
      return '请输入内容';
    }
    if (value.contains(' ')) {
      return '不能包含空格';
    }
    return null; // 验证通过
  }),
)
```

---

## 加密工具 (EncryptUtil)

### 基础加密

```dart
// AES 加密
final encrypted = EncryptUtil.aesEncrypt('明文内容');

// AES 解密
final decrypted = EncryptUtil.aesDecrypt(encrypted);
```

### 分段加密（长内容）

```dart
// 分段加密
final encrypted = EncryptUtil.aesEncryptChunked(
  longContent,
  config: ChunkedEncryptConfig(
    chunkSize: 1024 * 100,  // 100KB 每段
    separator: '|CHUNK|',
  ),
);

// 分段解密
final decrypted = EncryptUtil.aesDecryptChunked(encrypted);
```

### 智能加密

```dart
// 自动判断是否需要分段
final encrypted = EncryptUtil.smartEncrypt(
  content,
  threshold: 1024 * 100,  // 超过 100KB 自动分段
);

final decrypted = EncryptUtil.smartDecrypt(encrypted);
```

### MD5 哈希

```dart
final hash = EncryptUtil.md5('内容');
```

---

## 媒体选择器 (MediaPicker)

### 选择图片

```dart
// 从相册选择
final result = await MediaPicker.pickImage(source: MediaSource.gallery);

// 使用相机拍照
final result = await MediaPicker.pickImage(source: MediaSource.camera);

// 便捷方法
final result = await MediaPicker.openGallery();
final result = await MediaPicker.openCamera();
final result = await MediaPicker.openFrontCamera();

// 处理结果
if (result.success) {
  final media = result.media!;
  print('路径: ${media.path}');
  print('大小: ${media.sizeFormatted}');
  final bytes = await media.readAsBytes();
}
```

### 选择多张图片

```dart
final result = await MediaPicker.pickMultipleImages(limit: 9);

if (result.success) {
  for (final media in result.mediaList!) {
    print('图片: ${media.name}');
  }
}
```

### 选择视频

```dart
// 从相册选择
final result = await MediaPicker.pickVideo(source: MediaSource.gallery);

// 录制视频（限制时长）
final result = await MediaPicker.pickVideo(
  source: MediaSource.camera,
  config: MediaPickerConfig(
    maxVideoDuration: Duration(seconds: 60),
  ),
);
```

### 配置选项

```dart
final config = MediaPickerConfig(
  maxWidth: 1920,
  maxHeight: 1080,
  imageQuality: ImageQuality.high,  // low, medium, high, original
  preferredCameraDevice: CameraDevice.rear,  // front, rear
  maxVideoDuration: Duration(minutes: 5),
);
```

---

## 相册保存 (GallerySaver)

### 保存图片

```dart
// 保存图片数据
final result = await GallerySaver.saveImage(
  imageBytes,
  name: 'my_photo',
  quality: 100,
);

// 保存图片文件
final result = await GallerySaver.saveImageFile(file);

// 保存网络图片
final result = await GallerySaver.saveNetworkImage(
  'https://example.com/image.jpg',
);
```

### 保存视频

```dart
// 保存视频文件
final result = await GallerySaver.saveVideoFile(videoFile);

// 保存网络视频
final result = await GallerySaver.saveNetworkVideo(
  'https://example.com/video.mp4',
  onProgress: (received, total) {
    print('进度: ${(received / total * 100).toStringAsFixed(1)}%');
  },
);
```

---

## 临时文件管理 (TempFileManager)

### 初始化

```dart
final tempManager = TempFileManager();
await tempManager.init();
```

### 保存临时文件

```dart
// 保存字节数据
final tempFile = await tempManager.saveBytes(
  data,
  fileName: 'temp_image.jpg',
  type: TempFileType.image,
  expiresIn: Duration(hours: 24),
);

// 保存文件
final tempFile = await tempManager.saveFile(
  sourceFile,
  type: TempFileType.document,
);
```

### 文件类型

```dart
TempFileType.download   // 下载文件
TempFileType.cache      // 缓存文件
TempFileType.image      // 图片
TempFileType.video      // 视频
TempFileType.audio      // 音频
TempFileType.document   // 文档
TempFileType.other      // 其他
```

### 清理文件

```dart
// 清理过期文件
await tempManager.cleanExpired(Duration(days: 7));

// 清理所有临时文件
await tempManager.cleanAll();

// 清理指定类型
await tempManager.cleanAll(type: TempFileType.cache);
```

### 统计信息

```dart
// 获取总大小
final totalSize = await tempManager.getTotalSize();

// 获取文件数量
final count = await tempManager.getFileCount();
```

---

## 工具使用规则

### 1. 尺寸必须使用适配扩展

```dart
// ✅ 正确
Container(width: 100.w, height: 50.h)
Text('内容', style: TextStyle(fontSize: 14.sp))

// ❌ 错误
Container(width: 100, height: 50)
Text('内容', style: TextStyle(fontSize: 14))
```

### 2. 间距使用 Gap 预设

```dart
// ✅ 正确
Column(children: [widget1, Gap.v16, widget2])

// ❌ 错误
Column(children: [widget1, SizedBox(height: 16), widget2])
```

### 3. 验证器组合使用

```dart
// ✅ 正确 - 组合验证器
validator: Validators.compose([
  Validators.required(),
  Validators.email(),
])

// ❌ 错误 - 手写验证逻辑
validator: (value) {
  if (value == null) return '必填';
  if (!value.contains('@')) return '邮箱格式错误';
  return null;
}
```

### 4. 敏感数据加密存储

```dart
// ✅ 正确 - 敏感数据加密后存储
final encrypted = EncryptUtil.aesEncrypt(sensitiveData);
await storage.setString('sensitive', encrypted);

// ❌ 错误 - 明文存储敏感数据
await storage.setString('password', password);
```

---

## 工具速查表

| 用途 | 工具/方法 |
|------|----------|
| 宽度适配 | `100.w` |
| 高度适配 | `50.h` |
| 字体适配 | `14.sp` |
| 圆角适配 | `8.r` |
| 垂直间距 | `Gap.v16` |
| 水平间距 | `Gap.h16` |
| 全方向内边距 | `16.paddingAll` |
| 存储字符串 | `Storage.instance.setString()` |
| 存储 JSON | `Storage.instance.setJson()` |
| 必填验证 | `Validators.required()` |
| 邮箱验证 | `Validators.email()` |
| 手机验证 | `Validators.phone()` |
| AES 加密 | `EncryptUtil.aesEncrypt()` |
| 选择图片 | `MediaPicker.pickImage()` |
| 保存到相册 | `GallerySaver.saveImage()` |
| 临时文件 | `TempFileManager.saveBytes()` |
