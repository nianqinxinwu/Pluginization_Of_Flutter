import 'package:flutter/material.dart';

/// App Confirm Dialog - 确认弹窗组件
class AppConfirmDialog extends StatelessWidget {
  const AppConfirmDialog({
    super.key,
    required this.title,
    this.content,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
  });

  final String title;
  final String? content;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement confirm dialog
    return AlertDialog(
      title: Text(title),
      content: content != null ? Text(content!) : null,
      actions: [
        TextButton(
          onPressed: onCancel ?? () => Navigator.of(context).pop(false),
          child: Text(cancelText ?? 'Cancel'),
        ),
        TextButton(
          onPressed: onConfirm ?? () => Navigator.of(context).pop(true),
          child: Text(confirmText ?? 'Confirm'),
        ),
      ],
    );
  }
}
