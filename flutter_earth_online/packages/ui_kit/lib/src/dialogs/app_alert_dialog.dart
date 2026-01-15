import 'package:flutter/material.dart';

/// App Alert Dialog - 警告弹窗组件
class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
    required this.title,
    this.content,
    this.confirmText,
    this.onConfirm,
  });

  final String title;
  final String? content;
  final String? confirmText;
  final VoidCallback? onConfirm;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement alert dialog
    return AlertDialog(
      title: Text(title),
      content: content != null ? Text(content!) : null,
      actions: [
        TextButton(
          onPressed: onConfirm ?? () => Navigator.of(context).pop(),
          child: Text(confirmText ?? 'OK'),
        ),
      ],
    );
  }
}
