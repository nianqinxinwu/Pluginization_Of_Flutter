import 'package:flutter/material.dart';

/// 按钮类型
enum AppButtonType {
  /// 主要按钮
  primary,

  /// 次要按钮（边框）
  secondary,

  /// 文本按钮
  text,

  /// 图标按钮
  icon,

  /// 填充按钮
  filled,

  /// 轮廓按钮
  outlined,
}

/// 按钮尺寸
enum AppButtonSize {
  /// 小尺寸 - 高度 32
  small,

  /// 中等尺寸 - 高度 44
  medium,

  /// 大尺寸 - 高度 50
  large,
}

/// 按钮组件
///
/// 提供多种按钮样式封装
///
/// 使用示例：
/// ```dart
/// AppButton.primary(
///   text: '确定',
///   onTap: () => print('clicked'),
/// )
///
/// AppButton.secondary(
///   text: '取消',
///   onTap: () => Navigator.pop(context),
/// )
///
/// AppButton.icon(
///   icon: Icons.add,
///   onTap: () {},
/// )
/// ```
class AppButton extends StatelessWidget {
  /// 按钮类型
  final AppButtonType type;

  /// 按钮尺寸
  final AppButtonSize size;

  /// 点击事件
  final VoidCallback? onTap;

  /// 文字内容
  final String? text;

  /// 图标
  final Widget? icon;

  /// 子组件
  final Widget? child;

  /// 宽度
  final double? width;

  /// 高度
  final double? height;

  /// 背景颜色
  final Color? backgroundColor;

  /// 文字颜色
  final Color? textColor;

  /// 边框颜色
  final Color? borderColor;

  /// 圆角
  final double? borderRadius;

  /// 是否禁用
  final bool disabled;

  /// 是否加载中
  final bool loading;

  /// 内边距
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.medium,
    this.onTap,
    this.text,
    this.icon,
    this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.disabled = false,
    this.loading = false,
    this.padding,
  });

  /// 主要按钮
  const AppButton.primary({
    super.key,
    this.text,
    this.icon,
    this.child,
    this.onTap,
    this.width = double.infinity,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.disabled = false,
    this.loading = false,
    this.padding,
    this.size = AppButtonSize.large,
  })  : type = AppButtonType.primary,
        borderColor = null;

  /// 次要按钮（边框）
  const AppButton.secondary({
    super.key,
    this.text,
    this.icon,
    this.child,
    this.onTap,
    this.width = double.infinity,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.disabled = false,
    this.loading = false,
    this.padding,
    this.size = AppButtonSize.large,
  }) : type = AppButtonType.secondary;

  /// 文本按钮
  const AppButton.text({
    super.key,
    this.text,
    this.icon,
    this.child,
    this.onTap,
    this.width,
    this.height,
    this.textColor,
    this.borderRadius,
    this.disabled = false,
    this.loading = false,
    this.padding,
    this.size = AppButtonSize.medium,
  })  : type = AppButtonType.text,
        backgroundColor = null,
        borderColor = null;

  /// 图标按钮
  const AppButton.icon({
    super.key,
    required this.icon,
    this.onTap,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.disabled = false,
    this.loading = false,
    this.padding,
    this.size = AppButtonSize.medium,
  })  : type = AppButtonType.icon,
        text = null,
        child = null,
        textColor = null,
        borderColor = null;

  /// 填充按钮
  const AppButton.filled({
    super.key,
    this.text,
    this.icon,
    this.child,
    this.onTap,
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.disabled = false,
    this.loading = false,
    this.padding,
    this.size = AppButtonSize.medium,
  })  : type = AppButtonType.filled,
        borderColor = null;

  /// 轮廓按钮
  const AppButton.outlined({
    super.key,
    this.text,
    this.icon,
    this.child,
    this.onTap,
    this.width,
    this.height,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.disabled = false,
    this.loading = false,
    this.padding,
    this.size = AppButtonSize.medium,
  })  : type = AppButtonType.outlined,
        backgroundColor = null;

  /// 获取按钮高度
  double get _height {
    if (height != null) return height!;
    switch (size) {
      case AppButtonSize.small:
        return 32;
      case AppButtonSize.medium:
        return 44;
      case AppButtonSize.large:
        return 50;
    }
  }

  /// 获取默认圆角
  double get _borderRadius => borderRadius ?? 8;

  /// 获取文字大小
  double get _fontSize {
    switch (size) {
      case AppButtonSize.small:
        return 13;
      case AppButtonSize.medium:
        return 15;
      case AppButtonSize.large:
        return 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // 根据类型获取样式
    Color bgColor;
    Color fgColor;
    BorderSide? side;

    switch (type) {
      case AppButtonType.primary:
        bgColor = backgroundColor ?? colorScheme.primary;
        fgColor = textColor ?? colorScheme.onPrimary;
        side = null;
        break;
      case AppButtonType.secondary:
        bgColor = backgroundColor ?? Colors.transparent;
        fgColor = textColor ?? colorScheme.primary;
        side = BorderSide(color: borderColor ?? colorScheme.primary);
        break;
      case AppButtonType.text:
        bgColor = Colors.transparent;
        fgColor = textColor ?? colorScheme.primary;
        side = null;
        break;
      case AppButtonType.icon:
        bgColor = backgroundColor ?? Colors.transparent;
        fgColor = textColor ?? colorScheme.onSurface;
        side = null;
        break;
      case AppButtonType.filled:
        bgColor = backgroundColor ?? colorScheme.primaryContainer;
        fgColor = textColor ?? colorScheme.onPrimaryContainer;
        side = null;
        break;
      case AppButtonType.outlined:
        bgColor = Colors.transparent;
        fgColor = textColor ?? colorScheme.outline;
        side = BorderSide(color: borderColor ?? colorScheme.outline);
        break;
    }

    // 禁用状态
    if (disabled) {
      bgColor = bgColor.withValues(alpha: 0.5);
      fgColor = fgColor.withValues(alpha: 0.5);
    }

    // 构建子组件
    Widget buttonChild;
    if (loading) {
      buttonChild = SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(fgColor),
        ),
      );
    } else if (child != null) {
      buttonChild = child!;
    } else if (type == AppButtonType.icon && icon != null) {
      buttonChild = IconTheme(
        data: IconThemeData(color: fgColor, size: _fontSize + 4),
        child: icon!,
      );
    } else {
      final textWidget = text != null
          ? Text(
              text!,
              style: TextStyle(
                fontSize: _fontSize,
                fontWeight: FontWeight.w600,
                color: fgColor,
              ),
            )
          : null;

      if (icon != null && textWidget != null) {
        buttonChild = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconTheme(
              data: IconThemeData(color: fgColor, size: _fontSize + 2),
              child: icon!,
            ),
            const SizedBox(width: 8),
            textWidget,
          ],
        );
      } else {
        buttonChild = textWidget ?? const SizedBox.shrink();
      }
    }

    return SizedBox(
      width: width,
      height: _height,
      child: ElevatedButton(
        onPressed: disabled || loading ? null : onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(bgColor),
          foregroundColor: WidgetStatePropertyAll(fgColor),
          elevation: const WidgetStatePropertyAll(0),
          padding: WidgetStatePropertyAll(
            padding ?? const EdgeInsets.symmetric(horizontal: 16),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
              side: side ?? BorderSide.none,
            ),
          ),
          minimumSize: const WidgetStatePropertyAll(Size(0, 0)),
        ),
        child: buttonChild,
      ),
    );
  }
}
