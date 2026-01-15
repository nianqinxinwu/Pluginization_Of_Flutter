import 'package:flutter/material.dart';

/// App Icon Button - 图标按钮组件
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement icon button widget
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
