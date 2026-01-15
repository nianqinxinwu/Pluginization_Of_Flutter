import 'package:flutter/material.dart';

/// 应用颜色配置
///
/// 通过 BuildContext 扩展方法访问：
/// ```dart
/// context.colors.primary
/// context.colors.success
/// ```
class AppColors {
  final BuildContext _context;

  AppColors._(this._context);

  /// 从 BuildContext 创建
  factory AppColors.of(BuildContext context) => AppColors._(context);

  ColorScheme get _colorScheme => Theme.of(_context).colorScheme;

  // ==================== Material 3 系统颜色 ====================

  /// 主色
  Color get primary => _colorScheme.primary;

  /// 主色容器
  Color get primaryContainer => _colorScheme.primaryContainer;

  /// 主色上的文字
  Color get onPrimary => _colorScheme.onPrimary;

  /// 主色容器上的文字
  Color get onPrimaryContainer => _colorScheme.onPrimaryContainer;

  /// 次要色
  Color get secondary => _colorScheme.secondary;

  /// 次要色容器
  Color get secondaryContainer => _colorScheme.secondaryContainer;

  /// 次要色上的文字
  Color get onSecondary => _colorScheme.onSecondary;

  /// 次要色容器上的文字
  Color get onSecondaryContainer => _colorScheme.onSecondaryContainer;

  /// 第三色
  Color get tertiary => _colorScheme.tertiary;

  /// 第三色容器
  Color get tertiaryContainer => _colorScheme.tertiaryContainer;

  /// 第三色上的文字
  Color get onTertiary => _colorScheme.onTertiary;

  /// 第三色容器上的文字
  Color get onTertiaryContainer => _colorScheme.onTertiaryContainer;

  /// 错误色
  Color get error => _colorScheme.error;

  /// 错误色容器
  Color get errorContainer => _colorScheme.errorContainer;

  /// 错误色上的文字
  Color get onError => _colorScheme.onError;

  /// 错误色容器上的文字
  Color get onErrorContainer => _colorScheme.onErrorContainer;

  /// 背景色
  Color get surface => _colorScheme.surface;

  /// 表面变体色
  Color get surfaceContainerHighest => _colorScheme.surfaceContainerHighest;

  /// 背景色上的文字
  Color get onSurface => _colorScheme.onSurface;

  /// 表面变体上的文字
  Color get onSurfaceVariant => _colorScheme.onSurfaceVariant;

  /// 轮廓色
  Color get outline => _colorScheme.outline;

  /// 轮廓变体色
  Color get outlineVariant => _colorScheme.outlineVariant;

  /// 阴影色
  Color get shadow => _colorScheme.shadow;

  /// 反转表面色
  Color get inverseSurface => _colorScheme.inverseSurface;

  /// 反转主色
  Color get inversePrimary => _colorScheme.inversePrimary;

  /// 反转表面上的文字
  Color get onInverseSurface => _colorScheme.onInverseSurface;

  /// 亮度
  Brightness get brightness => _colorScheme.brightness;

  /// 是否为暗色模式
  bool get isDark => brightness == Brightness.dark;

  // ==================== 自定义扩展颜色 ====================

  /// 信息色
  Color get info => isDark ? const Color(0xFF64B5F6) : const Color(0xFF2196F3);

  /// 成功色
  Color get success =>
      isDark ? const Color(0xFF81C784) : const Color(0xFF4CAF50);

  /// 警告色
  Color get warning =>
      isDark ? const Color(0xFFFFD54F) : const Color(0xFFFFC107);

  /// 危险色
  Color get danger =>
      isDark ? const Color(0xFFE57373) : const Color(0xFFF44336);

  /// 高亮色
  Color get highlight =>
      isDark ? const Color(0xFFFFB4A9) : const Color(0xFFF77866);

  /// 分割线颜色
  Color get divider => isDark ? Colors.white12 : Colors.black12;

  /// 禁用色
  Color get disabled => isDark ? Colors.white38 : Colors.black38;

  /// 遮罩色
  Color get mask => Colors.black54;

  /// 卡片背景色
  Color get cardBackground => isDark ? const Color(0xFF1E1E1E) : Colors.white;

  /// 输入框背景色
  Color get inputBackground =>
      isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF5F5F5);
}

/// BuildContext 扩展 - 颜色
extension AppColorsExtension on BuildContext {
  /// 获取应用颜色
  AppColors get colors => AppColors.of(this);
}

/// 静态颜色常量（用于不需要 context 的场景）
class StaticColors {
  StaticColors._();

  // 品牌色
  static const Color brand = Color(0xFF5F84FF);
  static const Color brandLight = Color(0xFF8FA8FF);
  static const Color brandDark = Color(0xFF3D5ADB);

  // 功能色
  static const Color info = Color(0xFF2196F3);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color danger = Color(0xFFF44336);

  // 中性色
  static const Color title = Color(0xFF1A1A1A);
  static const Color subtitle = Color(0xFF666666);
  static const Color placeholder = Color(0xFF999999);
  static const Color border = Color(0xFFE5E5E5);
  static const Color background = Color(0xFFF5F5F5);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // 透明色
  static const Color transparent = Colors.transparent;
}
