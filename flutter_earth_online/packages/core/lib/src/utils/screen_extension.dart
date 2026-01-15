import 'package:flutter/material.dart';
import 'screen_util.dart';

/// 数值屏幕适配扩展
///
/// 提供便捷的适配语法：
/// ```dart
/// Container(
///   width: 100.w,           // 宽度适配
///   height: 50.h,           // 高度适配
///   margin: 16.marginAll,   // 外边距
///   padding: 12.paddingH,   // 水平内边距
///   child: Text(
///     'Hello',
///     style: TextStyle(
///       fontSize: 14.sp,    // 字体适配
///     ),
///   ),
/// )
/// ```
extension ScreenExtension on num {
  // ==================== 尺寸适配 ====================

  /// 宽度适配
  double get w => ScreenUtil.setWidth(this);

  /// 高度适配
  double get h => ScreenUtil.setHeight(this);

  /// 字体适配
  double get sp => ScreenUtil.setSp(this);

  /// 圆角适配
  double get r => ScreenUtil.setRadius(this);

  // ==================== SizedBox ====================

  /// 宽度方向的间距
  SizedBox get horizontalSpace => SizedBox(width: w);

  /// 高度方向的间距
  SizedBox get verticalSpace => SizedBox(height: h);

  /// 宽度方向的间距（原始值，不适配）
  SizedBox get hGap => SizedBox(width: toDouble());

  /// 高度方向的间距（原始值，不适配）
  SizedBox get vGap => SizedBox(height: toDouble());

  // ==================== EdgeInsets ====================

  /// 四周内边距（适配）
  EdgeInsets get paddingAll => EdgeInsets.all(r);

  /// 水平内边距（适配）
  EdgeInsets get paddingH => EdgeInsets.symmetric(horizontal: w);

  /// 垂直内边距（适配）
  EdgeInsets get paddingV => EdgeInsets.symmetric(vertical: h);

  /// 左内边距（适配）
  EdgeInsets get paddingL => EdgeInsets.only(left: w);

  /// 右内边距（适配）
  EdgeInsets get paddingR => EdgeInsets.only(right: w);

  /// 上内边距（适配）
  EdgeInsets get paddingT => EdgeInsets.only(top: h);

  /// 下内边距（适配）
  EdgeInsets get paddingB => EdgeInsets.only(bottom: h);

  /// 四周外边距（适配）
  EdgeInsets get marginAll => EdgeInsets.all(r);

  /// 水平外边距（适配）
  EdgeInsets get marginH => EdgeInsets.symmetric(horizontal: w);

  /// 垂直外边距（适配）
  EdgeInsets get marginV => EdgeInsets.symmetric(vertical: h);

  /// 左外边距（适配）
  EdgeInsets get marginL => EdgeInsets.only(left: w);

  /// 右外边距（适配）
  EdgeInsets get marginR => EdgeInsets.only(right: w);

  /// 上外边距（适配）
  EdgeInsets get marginT => EdgeInsets.only(top: h);

  /// 下外边距（适配）
  EdgeInsets get marginB => EdgeInsets.only(bottom: h);

  // ==================== BorderRadius ====================

  /// 四角圆角
  BorderRadius get borderRadiusAll => BorderRadius.circular(r);

  /// 顶部圆角
  BorderRadius get borderRadiusTop => BorderRadius.vertical(
        top: Radius.circular(r),
      );

  /// 底部圆角
  BorderRadius get borderRadiusBottom => BorderRadius.vertical(
        bottom: Radius.circular(r),
      );

  /// 左侧圆角
  BorderRadius get borderRadiusLeft => BorderRadius.horizontal(
        left: Radius.circular(r),
      );

  /// 右侧圆角
  BorderRadius get borderRadiusRight => BorderRadius.horizontal(
        right: Radius.circular(r),
      );

  // ==================== Radius ====================

  /// 圆角
  Radius get radius => Radius.circular(r);

  // ==================== 原始值快捷方法 ====================

  /// 四周内边距（原始值）
  EdgeInsets get paddingAllRaw => EdgeInsets.all(toDouble());

  /// 水平内边距（原始值）
  EdgeInsets get paddingHRaw => EdgeInsets.symmetric(horizontal: toDouble());

  /// 垂直内边距（原始值）
  EdgeInsets get paddingVRaw => EdgeInsets.symmetric(vertical: toDouble());

  /// 四周圆角（原始值）
  BorderRadius get borderRadiusAllRaw => BorderRadius.circular(toDouble());
}

/// EdgeInsets 扩展
extension EdgeInsetsExtension on EdgeInsets {
  /// 添加水平边距
  EdgeInsets addH(double value) => copyWith(
        left: left + value.w,
        right: right + value.w,
      );

  /// 添加垂直边距
  EdgeInsets addV(double value) => copyWith(
        top: top + value.h,
        bottom: bottom + value.h,
      );

  /// 添加左边距
  EdgeInsets addL(double value) => copyWith(left: left + value.w);

  /// 添加右边距
  EdgeInsets addR(double value) => copyWith(right: right + value.w);

  /// 添加上边距
  EdgeInsets addT(double value) => copyWith(top: top + value.h);

  /// 添加下边距
  EdgeInsets addB(double value) => copyWith(bottom: bottom + value.h);
}

/// Size 扩展
extension SizeExtension on Size {
  /// 适配后的 Size
  Size get adapted => Size(width.w, height.h);
}

/// 便捷的间距 Widget
class Gap {
  Gap._();

  /// 水平间距（适配）
  static SizedBox h(double width) => SizedBox(width: width.w);

  /// 垂直间距（适配）
  static SizedBox v(double height) => SizedBox(height: height.h);

  /// 水平间距（原始值）
  static SizedBox hRaw(double width) => SizedBox(width: width);

  /// 垂直间距（原始值）
  static SizedBox vRaw(double height) => SizedBox(height: height);

  // 常用间距预设
  static SizedBox get h4 => SizedBox(width: 4.w);
  static SizedBox get h8 => SizedBox(width: 8.w);
  static SizedBox get h12 => SizedBox(width: 12.w);
  static SizedBox get h16 => SizedBox(width: 16.w);
  static SizedBox get h20 => SizedBox(width: 20.w);
  static SizedBox get h24 => SizedBox(width: 24.w);

  static SizedBox get v4 => SizedBox(height: 4.h);
  static SizedBox get v8 => SizedBox(height: 8.h);
  static SizedBox get v12 => SizedBox(height: 12.h);
  static SizedBox get v16 => SizedBox(height: 16.h);
  static SizedBox get v20 => SizedBox(height: 20.h);
  static SizedBox get v24 => SizedBox(height: 24.h);
}
