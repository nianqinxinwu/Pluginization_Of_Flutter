import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 图片类型
enum AppImageType {
  /// 网络图片
  network,

  /// 本地资源图片
  asset,

  /// 文件图片
  file,
}

/// 图片组件
///
/// 提供统一的图片加载和显示
///
/// 使用示例：
/// ```dart
/// AppImage.network(
///   'https://example.com/image.jpg',
///   width: 100,
///   height: 100,
/// )
///
/// AppImage.asset(
///   'assets/images/logo.png',
///   width: 50,
/// )
/// ```
class AppImage extends StatelessWidget {
  /// 图片路径/URL
  final String source;

  /// 图片类型
  final AppImageType type;

  /// 宽度
  final double? width;

  /// 高度
  final double? height;

  /// 圆角
  final double? borderRadius;

  /// 填充方式
  final BoxFit fit;

  /// 背景颜色
  final Color? backgroundColor;

  /// 占位组件
  final Widget? placeholder;

  /// 错误组件
  final Widget? errorWidget;

  /// 是否圆形
  final bool isCircle;

  /// 点击回调
  final VoidCallback? onTap;

  const AppImage({
    super.key,
    required this.source,
    required this.type,
    this.width,
    this.height,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.placeholder,
    this.errorWidget,
    this.isCircle = false,
    this.onTap,
  });

  /// 网络图片
  const AppImage.network(
    this.source, {
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.placeholder,
    this.errorWidget,
    this.isCircle = false,
    this.onTap,
  }) : type = AppImageType.network;

  /// 本地资源图片
  const AppImage.asset(
    this.source, {
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.placeholder,
    this.errorWidget,
    this.isCircle = false,
    this.onTap,
  }) : type = AppImageType.asset;

  /// 文件图片
  const AppImage.file(
    this.source, {
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.placeholder,
    this.errorWidget,
    this.isCircle = false,
    this.onTap,
  }) : type = AppImageType.file;

  /// 圆形头像
  const AppImage.avatar(
    this.source, {
    super.key,
    this.type = AppImageType.network,
    double size = 40,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.placeholder,
    this.errorWidget,
    this.onTap,
  })  : width = size,
        height = size,
        borderRadius = null,
        isCircle = true;

  /// 默认占位组件
  Widget get _defaultPlaceholder => Container(
        width: width,
        height: height,
        color: backgroundColor ?? Colors.grey.shade200,
        child: const Center(
          child: CupertinoActivityIndicator(),
        ),
      );

  /// 默认错误组件
  Widget get _defaultErrorWidget => Container(
        width: width,
        height: height,
        color: backgroundColor ?? Colors.grey.shade200,
        child: const Center(
          child: Icon(
            CupertinoIcons.photo,
            color: Colors.grey,
            size: 24,
          ),
        ),
      );

  /// 构建图片组件
  Widget _buildImage() {
    switch (type) {
      case AppImageType.network:
        return _NetworkImage(
          url: source,
          width: width,
          height: height,
          fit: fit,
          placeholder: placeholder ?? _defaultPlaceholder,
          errorWidget: errorWidget ?? _defaultErrorWidget,
        );

      case AppImageType.asset:
        return Image.asset(
          source,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) =>
              errorWidget ?? _defaultErrorWidget,
        );

      case AppImageType.file:
        return Image.file(
          File(source),
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) =>
              errorWidget ?? _defaultErrorWidget,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget image = _buildImage();

    // 裁剪形状
    if (isCircle) {
      image = ClipOval(child: image);
    } else if (borderRadius != null && borderRadius! > 0) {
      image = ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: image,
      );
    }

    // 容器包装
    image = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius:
            isCircle ? null : BorderRadius.circular(borderRadius ?? 0),
      ),
      clipBehavior: Clip.antiAlias,
      child: image,
    );

    // 点击事件
    if (onTap != null) {
      image = GestureDetector(
        onTap: onTap,
        child: image,
      );
    }

    return image;
  }
}

/// 网络图片（带加载状态）
class _NetworkImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget placeholder;
  final Widget errorWidget;

  const _NetworkImage({
    required this.url,
    this.width,
    this.height,
    required this.fit,
    required this.placeholder,
    required this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    // 验证 URL
    if (url.isEmpty || !url.startsWith('http')) {
      return errorWidget;
    }

    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder;
      },
      errorBuilder: (context, error, stackTrace) => errorWidget,
    );
  }
}

/// 图标组件
///
/// 便捷的图标封装
class AppIcon extends StatelessWidget {
  /// 图标数据
  final IconData icon;

  /// 图标大小
  final double size;

  /// 图标颜色
  final Color? color;

  /// 点击回调
  final VoidCallback? onTap;

  const AppIcon(
    this.icon, {
    super.key,
    this.size = 24,
    this.color,
    this.onTap,
  });

  /// 小图标 - 16
  const AppIcon.small(
    this.icon, {
    super.key,
    this.color,
    this.onTap,
  }) : size = 16;

  /// 中图标 - 24
  const AppIcon.medium(
    this.icon, {
    super.key,
    this.color,
    this.onTap,
  }) : size = 24;

  /// 大图标 - 32
  const AppIcon.large(
    this.icon, {
    super.key,
    this.color,
    this.onTap,
  }) : size = 32;

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(
      icon,
      size: size,
      color: color,
    );

    if (onTap != null) {
      iconWidget = GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: iconWidget,
      );
    }

    return iconWidget;
  }
}
