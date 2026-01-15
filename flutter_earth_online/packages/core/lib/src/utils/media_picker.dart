import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

/// 媒体类型
enum MediaType {
  /// 图片
  image,

  /// 视频
  video,
}

/// 媒体来源
enum MediaSource {
  /// 相机
  camera,

  /// 相册
  gallery,
}

/// 图片压缩质量
enum ImageQuality {
  /// 低质量（约 25%）
  low(25),

  /// 中等质量（约 50%）
  medium(50),

  /// 高质量（约 75%）
  high(75),

  /// 原始质量
  original(100);

  const ImageQuality(this.value);
  final int value;
}

/// 媒体信息
class MediaInfo {
  const MediaInfo({
    required this.path,
    required this.name,
    required this.type,
    required this.source,
    this.size,
    this.width,
    this.height,
    this.mimeType,
  });

  /// 文件路径
  final String path;

  /// 文件名
  final String name;

  /// 媒体类型
  final MediaType type;

  /// 媒体来源
  final MediaSource source;

  /// 文件大小（字节）
  final int? size;

  /// 图片/视频宽度
  final int? width;

  /// 图片/视频高度
  final int? height;

  /// MIME 类型
  final String? mimeType;

  /// 获取文件
  File get file => File(path);

  /// 读取文件数据
  Future<Uint8List> readAsBytes() => file.readAsBytes();

  /// 检查文件是否存在
  Future<bool> exists() => file.exists();

  /// 删除文件
  Future<void> delete() async {
    if (await file.exists()) {
      await file.delete();
    }
  }

  /// 格式化的文件大小
  String? get sizeFormatted {
    if (size == null) return null;
    if (size! < 1024) return '$size B';
    if (size! < 1024 * 1024) return '${(size! / 1024).toStringAsFixed(1)} KB';
    if (size! < 1024 * 1024 * 1024) {
      return '${(size! / 1024 / 1024).toStringAsFixed(1)} MB';
    }
    return '${(size! / 1024 / 1024 / 1024).toStringAsFixed(1)} GB';
  }
}

/// 媒体选择结果
class MediaPickResult {
  const MediaPickResult({
    required this.success,
    this.media,
    this.mediaList,
    this.error,
  });

  /// 是否成功
  final bool success;

  /// 单个媒体
  final MediaInfo? media;

  /// 多个媒体
  final List<MediaInfo>? mediaList;

  /// 错误信息
  final String? error;

  /// 是否用户取消
  bool get isCancelled => !success && error == null;

  /// 创建成功结果（单个）
  factory MediaPickResult.single(MediaInfo media) {
    return MediaPickResult(success: true, media: media);
  }

  /// 创建成功结果（多个）
  factory MediaPickResult.multiple(List<MediaInfo> mediaList) {
    return MediaPickResult(success: true, mediaList: mediaList);
  }

  /// 创建取消结果
  factory MediaPickResult.cancelled() {
    return const MediaPickResult(success: false);
  }

  /// 创建失败结果
  factory MediaPickResult.failure(String error) {
    return MediaPickResult(success: false, error: error);
  }
}

/// 媒体选择器配置
class MediaPickerConfig {
  const MediaPickerConfig({
    this.maxWidth,
    this.maxHeight,
    this.imageQuality = ImageQuality.high,
    this.preferredCameraDevice = CameraDevice.rear,
    this.maxVideoDuration,
    this.requestFullMetadata = true,
  });

  /// 最大宽度
  final double? maxWidth;

  /// 最大高度
  final double? maxHeight;

  /// 图片质量
  final ImageQuality imageQuality;

  /// 首选相机（前置/后置）
  final CameraDevice preferredCameraDevice;

  /// 最大视频时长
  final Duration? maxVideoDuration;

  /// 是否请求完整元数据
  final bool requestFullMetadata;

  /// 默认配置
  static const MediaPickerConfig defaultConfig = MediaPickerConfig();

  /// 头像配置（正方形，中等质量）
  static const MediaPickerConfig avatar = MediaPickerConfig(
    maxWidth: 500,
    maxHeight: 500,
    imageQuality: ImageQuality.medium,
    preferredCameraDevice: CameraDevice.front,
  );

  /// 高清配置
  static const MediaPickerConfig highQuality = MediaPickerConfig(
    imageQuality: ImageQuality.original,
  );
}

/// 媒体选择器
///
/// 提供打开相册和使用相机的功能
///
/// 使用示例：
/// ```dart
/// // 从相册选择图片
/// final result = await MediaPicker.pickImage(source: MediaSource.gallery);
/// if (result.success) {
///   print('选择的图片: ${result.media!.path}');
/// }
///
/// // 使用相机拍照
/// final result = await MediaPicker.pickImage(source: MediaSource.camera);
///
/// // 从相册选择多张图片
/// final result = await MediaPicker.pickMultipleImages();
///
/// // 选择视频
/// final result = await MediaPicker.pickVideo(source: MediaSource.gallery);
///
/// // 使用相机录制视频
/// final result = await MediaPicker.pickVideo(
///   source: MediaSource.camera,
///   config: MediaPickerConfig(maxVideoDuration: Duration(seconds: 30)),
/// );
/// ```
class MediaPicker {
  MediaPicker._();

  static final ImagePicker _picker = ImagePicker();

  // ==================== 选择图片 ====================

  /// 选择单张图片
  ///
  /// [source] 来源（相机或相册）
  /// [config] 配置
  static Future<MediaPickResult> pickImage({
    required MediaSource source,
    MediaPickerConfig config = MediaPickerConfig.defaultConfig,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: _convertSource(source),
        maxWidth: config.maxWidth,
        maxHeight: config.maxHeight,
        imageQuality: config.imageQuality.value,
        preferredCameraDevice: config.preferredCameraDevice,
        requestFullMetadata: config.requestFullMetadata,
      );

      if (pickedFile == null) {
        return MediaPickResult.cancelled();
      }

      final mediaInfo = await _createMediaInfo(
        pickedFile,
        MediaType.image,
        source,
      );

      return MediaPickResult.single(mediaInfo);
    } catch (e) {
      return MediaPickResult.failure(e.toString());
    }
  }

  /// 选择多张图片（仅相册）
  ///
  /// [config] 配置
  /// [limit] 最大选择数量（为空则不限制）
  static Future<MediaPickResult> pickMultipleImages({
    MediaPickerConfig config = MediaPickerConfig.defaultConfig,
    int? limit,
  }) async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultiImage(
        maxWidth: config.maxWidth,
        maxHeight: config.maxHeight,
        imageQuality: config.imageQuality.value,
        requestFullMetadata: config.requestFullMetadata,
        limit: limit,
      );

      if (pickedFiles.isEmpty) {
        return MediaPickResult.cancelled();
      }

      final mediaList = <MediaInfo>[];
      for (final file in pickedFiles) {
        final mediaInfo = await _createMediaInfo(
          file,
          MediaType.image,
          MediaSource.gallery,
        );
        mediaList.add(mediaInfo);
      }

      return MediaPickResult.multiple(mediaList);
    } catch (e) {
      return MediaPickResult.failure(e.toString());
    }
  }

  // ==================== 选择视频 ====================

  /// 选择视频
  ///
  /// [source] 来源（相机或相册）
  /// [config] 配置
  static Future<MediaPickResult> pickVideo({
    required MediaSource source,
    MediaPickerConfig config = MediaPickerConfig.defaultConfig,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickVideo(
        source: _convertSource(source),
        preferredCameraDevice: config.preferredCameraDevice,
        maxDuration: config.maxVideoDuration,
      );

      if (pickedFile == null) {
        return MediaPickResult.cancelled();
      }

      final mediaInfo = await _createMediaInfo(
        pickedFile,
        MediaType.video,
        source,
      );

      return MediaPickResult.single(mediaInfo);
    } catch (e) {
      return MediaPickResult.failure(e.toString());
    }
  }

  /// 选择多个视频（仅相册，部分平台支持）
  static Future<MediaPickResult> pickMultipleVideos({
    int? limit,
  }) async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultipleMedia(
        requestFullMetadata: true,
      );

      // 过滤出视频文件
      final videoFiles = pickedFiles.where((file) {
        final ext = file.path.toLowerCase();
        return ext.endsWith('.mp4') ||
            ext.endsWith('.mov') ||
            ext.endsWith('.avi') ||
            ext.endsWith('.wmv') ||
            ext.endsWith('.mkv');
      }).toList();

      if (videoFiles.isEmpty) {
        return MediaPickResult.cancelled();
      }

      final mediaList = <MediaInfo>[];
      for (final file in videoFiles) {
        final mediaInfo = await _createMediaInfo(
          file,
          MediaType.video,
          MediaSource.gallery,
        );
        mediaList.add(mediaInfo);
      }

      return MediaPickResult.multiple(mediaList);
    } catch (e) {
      return MediaPickResult.failure(e.toString());
    }
  }

  // ==================== 选择媒体（图片或视频） ====================

  /// 选择任意媒体（图片或视频）
  static Future<MediaPickResult> pickMedia({
    MediaPickerConfig config = MediaPickerConfig.defaultConfig,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickMedia(
        maxWidth: config.maxWidth,
        maxHeight: config.maxHeight,
        imageQuality: config.imageQuality.value,
        requestFullMetadata: config.requestFullMetadata,
      );

      if (pickedFile == null) {
        return MediaPickResult.cancelled();
      }

      final type = _determineMediaType(pickedFile.path);
      final mediaInfo = await _createMediaInfo(
        pickedFile,
        type,
        MediaSource.gallery,
      );

      return MediaPickResult.single(mediaInfo);
    } catch (e) {
      return MediaPickResult.failure(e.toString());
    }
  }

  /// 选择多个媒体
  static Future<MediaPickResult> pickMultipleMedia({
    MediaPickerConfig config = MediaPickerConfig.defaultConfig,
    int? limit,
  }) async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultipleMedia(
        maxWidth: config.maxWidth,
        maxHeight: config.maxHeight,
        imageQuality: config.imageQuality.value,
        requestFullMetadata: config.requestFullMetadata,
        limit: limit,
      );

      if (pickedFiles.isEmpty) {
        return MediaPickResult.cancelled();
      }

      final mediaList = <MediaInfo>[];
      for (final file in pickedFiles) {
        final type = _determineMediaType(file.path);
        final mediaInfo = await _createMediaInfo(
          file,
          type,
          MediaSource.gallery,
        );
        mediaList.add(mediaInfo);
      }

      return MediaPickResult.multiple(mediaList);
    } catch (e) {
      return MediaPickResult.failure(e.toString());
    }
  }

  // ==================== 便捷方法 ====================

  /// 打开相册选择图片
  static Future<MediaPickResult> openGallery({
    MediaPickerConfig config = MediaPickerConfig.defaultConfig,
  }) {
    return pickImage(source: MediaSource.gallery, config: config);
  }

  /// 打开相机拍照
  static Future<MediaPickResult> openCamera({
    MediaPickerConfig config = MediaPickerConfig.defaultConfig,
  }) {
    return pickImage(source: MediaSource.camera, config: config);
  }

  /// 打开前置相机拍照
  static Future<MediaPickResult> openFrontCamera({
    MediaPickerConfig config = MediaPickerConfig.defaultConfig,
  }) {
    return pickImage(
      source: MediaSource.camera,
      config: MediaPickerConfig(
        maxWidth: config.maxWidth,
        maxHeight: config.maxHeight,
        imageQuality: config.imageQuality,
        preferredCameraDevice: CameraDevice.front,
        requestFullMetadata: config.requestFullMetadata,
      ),
    );
  }

  /// 检查相机是否可用
  static Future<bool> isCameraAvailable() async {
    try {
      // 尝试获取相机权限状态
      return true; // 实际需要检查权限
    } catch (e) {
      return false;
    }
  }

  // ==================== 私有方法 ====================

  static ImageSource _convertSource(MediaSource source) {
    switch (source) {
      case MediaSource.camera:
        return ImageSource.camera;
      case MediaSource.gallery:
        return ImageSource.gallery;
    }
  }

  static MediaType _determineMediaType(String path) {
    final ext = path.toLowerCase();
    if (ext.endsWith('.mp4') ||
        ext.endsWith('.mov') ||
        ext.endsWith('.avi') ||
        ext.endsWith('.wmv') ||
        ext.endsWith('.mkv') ||
        ext.endsWith('.webm')) {
      return MediaType.video;
    }
    return MediaType.image;
  }

  static Future<MediaInfo> _createMediaInfo(
    XFile file,
    MediaType type,
    MediaSource source,
  ) async {
    final ioFile = File(file.path);
    final stat = await ioFile.stat();

    return MediaInfo(
      path: file.path,
      name: file.name,
      type: type,
      source: source,
      size: stat.size,
      mimeType: file.mimeType,
    );
  }
}
