import 'package:flutter/material.dart';

/// 间距尺寸配置
///
/// 提供统一的间距定义，包括 padding、margin、gap 等
///
/// 使用示例：
/// ```dart
/// Padding(
///   padding: EdgeInsets.all(AppSpace.page),
///   child: ...
/// )
/// ```
class AppSpace {
  AppSpace._();

  // ==================== 基础间距 ====================

  /// 无间距 - 0
  static const double none = 0;

  /// 极小间距 - 2
  static const double xxs = 2;

  /// 超小间距 - 4
  static const double xs = 4;

  /// 小间距 - 8
  static const double sm = 8;

  /// 中等间距 - 12
  static const double md = 12;

  /// 大间距 - 16
  static const double lg = 16;

  /// 超大间距 - 24
  static const double xl = 24;

  /// 极大间距 - 32
  static const double xxl = 32;

  // ==================== 组件专用间距 ====================

  /// 按钮内间距 - 5
  static const double button = 5;

  /// 按钮高度 - 50
  static const double buttonHeight = 50;

  /// 卡片内间距 - 15
  static const double card = 15;

  /// 列表视图间距 - 5
  static const double listView = 5;

  /// 列表行间距 - 10
  static const double listRow = 10;

  /// 列表项间距 - 8
  static const double listItem = 8;

  /// 页面水平间距 - 16
  static const double page = 16;

  /// 段落间距 - 24
  static const double paragraph = 24;

  /// 标题与内容间距 - 10
  static const double titleContent = 10;

  /// 图标与文字间距 - 小 - 5
  static const double iconTextSmall = 5;

  /// 图标与文字间距 - 中 - 10
  static const double iconTextMedium = 10;

  /// 图标与文字间距 - 大 - 15
  static const double iconTextLarge = 15;

  // ==================== EdgeInsets 便捷方法 ====================

  /// 输入框内间距
  static EdgeInsets get edgeInput => const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      );

  /// 页面内间距
  static EdgeInsets get edgePage => const EdgeInsets.symmetric(
        horizontal: page,
      );

  /// 卡片内间距
  static EdgeInsets get edgeCard => const EdgeInsets.all(card);

  /// 列表项内间距
  static EdgeInsets get edgeListItem => const EdgeInsets.symmetric(
        horizontal: page,
        vertical: listItem,
      );

  /// 对话框内间距
  static EdgeInsets get edgeDialog => const EdgeInsets.all(xl);

  /// 底部弹窗内间距
  static EdgeInsets get edgeSheet => const EdgeInsets.fromLTRB(
        page,
        lg,
        page,
        xl,
      );

  // ==================== 便捷工厂方法 ====================

  /// 水平间距
  static EdgeInsets horizontal(double value) =>
      EdgeInsets.symmetric(horizontal: value);

  /// 垂直间距
  static EdgeInsets vertical(double value) =>
      EdgeInsets.symmetric(vertical: value);

  /// 全部间距
  static EdgeInsets all(double value) => EdgeInsets.all(value);

  /// 仅左间距
  static EdgeInsets onlyLeft(double value) => EdgeInsets.only(left: value);

  /// 仅右间距
  static EdgeInsets onlyRight(double value) => EdgeInsets.only(right: value);

  /// 仅上间距
  static EdgeInsets onlyTop(double value) => EdgeInsets.only(top: value);

  /// 仅下间距
  static EdgeInsets onlyBottom(double value) => EdgeInsets.only(bottom: value);

  /// 对称间距
  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  /// 获取 SizedBox 水平间距
  static SizedBox gapH(double width) => SizedBox(width: width);

  /// 获取 SizedBox 垂直间距
  static SizedBox gapV(double height) => SizedBox(height: height);
}

/// 常用间距 SizedBox 扩展
extension SpaceExtension on num {
  /// 水平间距
  SizedBox get horizontalSpace => SizedBox(width: toDouble());

  /// 垂直间距
  SizedBox get verticalSpace => SizedBox(height: toDouble());
}
