import 'package:flutter/material.dart';

/// 文本样式配置
///
/// 通过 BuildContext 扩展方法访问：
/// ```dart
/// context.textStyles.bodyLarge
/// context.textStyles.titleMedium
/// ```
class AppTextStyles {
  final BuildContext _context;

  AppTextStyles._(this._context);

  /// 从 BuildContext 创建
  factory AppTextStyles.of(BuildContext context) => AppTextStyles._(context);

  TextTheme get _textTheme => Theme.of(_context).textTheme;

  // ==================== Material 3 文本样式 ====================

  /// Display Large - 57/64
  TextStyle? get displayLarge => _textTheme.displayLarge;

  /// Display Medium - 45/52
  TextStyle? get displayMedium => _textTheme.displayMedium;

  /// Display Small - 36/44
  TextStyle? get displaySmall => _textTheme.displaySmall;

  /// Headline Large - 32/40
  TextStyle? get headlineLarge => _textTheme.headlineLarge;

  /// Headline Medium - 28/36
  TextStyle? get headlineMedium => _textTheme.headlineMedium;

  /// Headline Small - 24/32
  TextStyle? get headlineSmall => _textTheme.headlineSmall;

  /// Title Large - 22/28
  TextStyle? get titleLarge => _textTheme.titleLarge;

  /// Title Medium - 16/24
  TextStyle? get titleMedium => _textTheme.titleMedium;

  /// Title Small - 14/20
  TextStyle? get titleSmall => _textTheme.titleSmall;

  /// Body Large - 16/24
  TextStyle? get bodyLarge => _textTheme.bodyLarge;

  /// Body Medium - 14/20
  TextStyle? get bodyMedium => _textTheme.bodyMedium;

  /// Body Small - 12/16
  TextStyle? get bodySmall => _textTheme.bodySmall;

  /// Label Large - 14/20
  TextStyle? get labelLarge => _textTheme.labelLarge;

  /// Label Medium - 12/16
  TextStyle? get labelMedium => _textTheme.labelMedium;

  /// Label Small - 11/16
  TextStyle? get labelSmall => _textTheme.labelSmall;

  // ==================== 别名（兼容旧代码） ====================

  /// @deprecated 使用 bodyLarge 代替
  TextStyle? get bodyText1 => bodyLarge;

  /// @deprecated 使用 bodyMedium 代替
  TextStyle? get bodyText2 => bodyMedium;

  /// @deprecated 使用 labelLarge 代替
  TextStyle? get button => labelLarge;

  /// @deprecated 使用 bodySmall 代替
  TextStyle? get caption => bodySmall;

  /// @deprecated 使用 labelSmall 代替
  TextStyle? get overline => labelSmall;

  /// @deprecated 使用 titleMedium 代替
  TextStyle? get subtitle1 => titleMedium;

  /// @deprecated 使用 titleSmall 代替
  TextStyle? get subtitle2 => titleSmall;
}

/// BuildContext 扩展 - 文本样式
extension AppTextStylesExtension on BuildContext {
  /// 获取应用文本样式
  AppTextStyles get textStyles => AppTextStyles.of(this);
}

/// 静态文本样式常量（用于不需要 context 的场景）
class StaticTextStyles {
  StaticTextStyles._();

  // ==================== 标题样式 ====================

  /// 大标题
  static const TextStyle title1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.3,
  );

  /// 中标题
  static const TextStyle title2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  /// 小标题
  static const TextStyle title3 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  // ==================== 正文样式 ====================

  /// 大正文
  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  /// 中正文
  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  /// 小正文
  static const TextStyle body3 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  // ==================== 功能样式 ====================

  /// 按钮文字
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  /// 链接文字
  static const TextStyle link = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
  );

  /// 标签文字
  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  /// 提示文字
  static const TextStyle hint = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  /// 导航标题
  static const TextStyle navigation = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );
}
