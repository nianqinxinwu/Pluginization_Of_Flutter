import 'package:flutter/material.dart';

/// IM 文本输入框
class IMTextInput extends StatelessWidget {
  /// 输入控制器
  final TextEditingController? controller;

  /// 焦点控制器
  final FocusNode? focusNode;

  /// 提示文字
  final String hintText;

  /// 最大行数
  final int maxLines;

  /// 装饰
  final InputDecoration? decoration;

  /// 是否启用
  final bool enabled;

  /// 提交回调
  final ValueChanged<String>? onSubmitted;

  /// 变化回调
  final ValueChanged<String>? onChanged;

  const IMTextInput({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText = '请输入消息...',
    this.maxLines = 4,
    this.decoration,
    this.enabled = true,
    this.onSubmitted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 36),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        enabled: enabled,
        maxLines: maxLines,
        minLines: 1,
        textInputAction: TextInputAction.send,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 16,
          height: 1.4,
        ),
        decoration: decoration ??
            InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xFFBBBBBB),
                fontSize: 16,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              border: InputBorder.none,
              isDense: true,
            ),
      ),
    );
  }
}
