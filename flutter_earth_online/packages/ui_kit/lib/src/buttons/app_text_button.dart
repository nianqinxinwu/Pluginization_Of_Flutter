import 'package:flutter/material.dart';

/// App Text Button - 文字按钮组件
class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement text button widget
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
