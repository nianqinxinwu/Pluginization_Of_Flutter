import 'package:flutter/material.dart';

/// App Empty Widget - 空白占位符组件
class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({
    super.key,
    this.message,
    this.icon,
  });

  final String? message;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement empty widget
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon ?? Icons.inbox_outlined, size: 64),
          const SizedBox(height: 16),
          Text(message ?? 'No data'),
        ],
      ),
    );
  }
}
