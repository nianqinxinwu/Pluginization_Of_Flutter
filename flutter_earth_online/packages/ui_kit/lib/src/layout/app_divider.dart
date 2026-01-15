import 'package:flutter/material.dart';

/// App Divider - 分割线组件
class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.height,
    this.thickness,
    this.color,
  });

  final double? height;
  final double? thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // TODO: Implement divider
    return Divider(
      height: height,
      thickness: thickness,
      color: color,
    );
  }
}
