import 'package:flutter/material.dart';

/// 文本组件
///
/// 提供常用的文本样式封装
///
/// 使用示例：
/// ```dart
/// AppText.title1('标题')
/// AppText.body1('正文内容', color: Colors.grey)
/// AppText.button(text: '按钮文字')
/// ```
class AppText extends StatelessWidget {
  /// 文字内容
  final String text;

  /// 文字样式
  final TextStyle? style;

  /// 文字颜色
  final Color? color;

  /// 文字大小
  final double? size;

  /// 文字粗细
  final FontWeight? weight;

  /// 最大行数
  final int? maxLines;

  /// 是否自动换行
  final bool? softWrap;

  /// 溢出处理
  final TextOverflow? overflow;

  /// 对齐方式
  final TextAlign? textAlign;

  /// 行高
  final double? height;

  /// 字母间距
  final double? letterSpacing;

  /// 装饰（下划线、删除线等）
  final TextDecoration? decoration;

  const AppText({
    super.key,
    required this.text,
    this.style,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.decoration,
  });

  /// 大标题 - 24/bold
  const AppText.title1(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.decoration,
  }) : style = const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        );

  /// 中标题 - 20/w600
  const AppText.title2(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.decoration,
  }) : style = const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        );

  /// 小标题 - 17/w600
  const AppText.title3(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.decoration,
  }) : style = const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        );

  /// 大正文 - 16/normal
  const AppText.body1(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.decoration,
  }) : style = const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
        );

  /// 中正文 - 14/normal
  const AppText.body2(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.decoration,
  }) : style = const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        );

  /// 小正文 - 12/normal
  const AppText.body3(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.decoration,
  }) : style = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        );

  /// 按钮文字 - 16/w600
  const AppText.button({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.decoration,
  }) : style = const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );

  /// 标签文字 - 12/w500
  const AppText.label(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.decoration,
  }) : style = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        );

  /// 提示文字 - 12/normal
  const AppText.hint(
    this.text, {
    super.key,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.decoration,
  }) : style = const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        );

  /// 导航标题 - 17/w600
  const AppText.navigation({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
    this.maxLines = 1,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.decoration,
  }) : style = const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        );

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return const SizedBox.shrink();
    }

    return Text(
      text,
      style: style?.copyWith(
            color: color,
            fontSize: size,
            fontWeight: weight,
            height: height,
            letterSpacing: letterSpacing,
            decoration: decoration,
          ) ??
          TextStyle(
            color: color,
            fontSize: size,
            fontWeight: weight,
            height: height,
            letterSpacing: letterSpacing,
            decoration: decoration,
          ),
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
