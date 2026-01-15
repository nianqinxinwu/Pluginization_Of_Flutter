import 'package:flutter/material.dart';

/// 圆角尺寸配置
///
/// 提供统一的圆角尺寸定义
///
/// 使用示例：
/// ```dart
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: BorderRadius.circular(AppRadius.card),
///   ),
/// )
/// ```
class AppRadius {
  AppRadius._();

  /// 无圆角
  static const double none = 0;

  /// 极小圆角 - 2
  static const double xs = 2;

  /// 小圆角 - 4
  static const double sm = 4;

  /// 中等圆角 - 8
  static const double md = 8;

  /// 大圆角 - 12
  static const double lg = 12;

  /// 超大圆角 - 16
  static const double xl = 16;

  /// 圆形 - 999
  static const double full = 999;

  // ==================== 组件专用圆角 ====================

  /// 按钮圆角 - 6
  static const double button = 6;

  /// 文字填充按钮圆角 - 3
  static const double buttonTextFilled = 3;

  /// 卡片圆角 - 10
  static const double card = 10;

  /// 底部弹窗圆角 - 20
  static const double sheet = 20;

  /// 输入框圆角 - 5
  static const double input = 5;

  /// 图片圆角 - 6
  static const double image = 6;

  /// 对话框圆角 - 16
  static const double dialog = 16;

  /// 标签圆角 - 4
  static const double tag = 4;

  /// 芯片圆角 - 8
  static const double chip = 8;

  /// 头像圆角 - 圆形
  static const double avatar = full;

  // ==================== 便捷方法 ====================

  /// 获取 BorderRadius.circular
  static BorderRadius circular(double radius) => BorderRadius.circular(radius);

  /// 获取统一圆角
  static BorderRadius all(double radius) =>
      BorderRadius.all(Radius.circular(radius));

  /// 获取顶部圆角
  static BorderRadius top(double radius) => BorderRadius.vertical(
        top: Radius.circular(radius),
      );

  /// 获取底部圆角
  static BorderRadius bottom(double radius) => BorderRadius.vertical(
        bottom: Radius.circular(radius),
      );

  /// 获取左侧圆角
  static BorderRadius left(double radius) => BorderRadius.horizontal(
        left: Radius.circular(radius),
      );

  /// 获取右侧圆角
  static BorderRadius right(double radius) => BorderRadius.horizontal(
        right: Radius.circular(radius),
      );
}
