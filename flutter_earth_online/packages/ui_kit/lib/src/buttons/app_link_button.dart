import 'package:flutter/material.dart';

/// App Link Button - 链接按钮组件
class AppLinkButton extends StatelessWidget {
  const AppLinkButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement link button widget
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
