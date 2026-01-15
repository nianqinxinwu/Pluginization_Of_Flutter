import 'package:flutter/material.dart';

/// App Loading Dialog - 加载弹窗组件
class AppLoadingDialog extends StatelessWidget {
  const AppLoadingDialog({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement loading dialog
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(message!),
          ],
        ],
      ),
    );
  }
}
