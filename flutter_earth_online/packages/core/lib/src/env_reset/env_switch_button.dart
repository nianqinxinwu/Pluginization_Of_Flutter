import 'package:flutter/material.dart';

import '../config/env_config.dart';

/// 全局 Navigator Key，用于在 MaterialApp.builder 外部访问 Navigator
final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

/// 环境切换悬浮按钮
/// 非 Release 环境时显示，点击可切换环境
class EnvSwitchButton extends StatefulWidget {
  const EnvSwitchButton({
    super.key,
    required this.child,
  });

  /// 子组件
  final Widget child;

  @override
  State<EnvSwitchButton> createState() => _EnvSwitchButtonState();
}

class _EnvSwitchButtonState extends State<EnvSwitchButton> {
  /// 悬浮按钮位置
  Offset _position = const Offset(20, 100);

  /// 是否正在拖动
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    EnvConfig.instance.addListener(_onEnvChanged);
  }

  @override
  void dispose() {
    EnvConfig.instance.removeListener(_onEnvChanged);
    super.dispose();
  }

  void _onEnvChanged() {
    if (mounted) setState(() {});
  }

  /// 获取环境对应的背景颜色
  Color _getEnvColor(EnvType envType) {
    switch (envType) {
      case EnvType.development:
        return const Color(0xFF4CAF50); // 绿色
      case EnvType.test:
        return const Color(0xFFFF9800); // 橙色
      case EnvType.production:
        return const Color(0xFF9C27B0); // 紫色
      case EnvType.release:
        return const Color(0xFF2196F3); // 蓝色
    }
  }

  void _showEnvSwitchDialog() {
    // 使用全局 navigatorKey 的 context 来显示对话框
    final navigatorContext = globalNavigatorKey.currentContext;
    if (navigatorContext != null) {
      showDialog(
        context: navigatorContext,
        builder: (context) => const EnvSwitchDialog(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Release 环境不显示悬浮按钮
    if (EnvConfig.instance.isRelease) {
      return widget.child;
    }

    final currentEnv = EnvConfig.instance.currentEnvType;
    final envColor = _getEnvColor(currentEnv);

    return Stack(
      children: [
        widget.child,
        Positioned(
          left: _position.dx,
          top: _position.dy,
          child: GestureDetector(
            onPanStart: (_) => _isDragging = true,
            onPanUpdate: (details) {
              setState(() {
                _position = Offset(
                  _position.dx + details.delta.dx,
                  _position.dy + details.delta.dy,
                );
              });
            },
            onPanEnd: (_) {
              _isDragging = false;
              _constrainPosition();
            },
            onTap: _isDragging ? null : _showEnvSwitchDialog,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: envColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: envColor.withValues(alpha: 0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    currentEnv.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 限制悬浮按钮在屏幕范围内
  void _constrainPosition() {
    final screenSize = MediaQuery.of(context).size;
    const buttonWidth = 80.0;
    const buttonHeight = 36.0;

    setState(() {
      _position = Offset(
        _position.dx.clamp(0, screenSize.width - buttonWidth),
        _position.dy.clamp(0, screenSize.height - buttonHeight - 50),
      );
    });
  }
}

/// 环境切换弹框
class EnvSwitchDialog extends StatelessWidget {
  const EnvSwitchDialog({super.key});

  /// 获取环境对应的背景颜色
  Color _getEnvColor(EnvType envType) {
    switch (envType) {
      case EnvType.development:
        return const Color(0xFF4CAF50); // 绿色
      case EnvType.test:
        return const Color(0xFFFF9800); // 橙色
      case EnvType.production:
        return const Color(0xFF9C27B0); // 紫色
      case EnvType.release:
        return const Color(0xFF2196F3); // 蓝色
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentEnv = EnvConfig.instance.currentEnvType;

    return AlertDialog(
      title: const Text('切换环境'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: EnvType.values.map((envType) {
          final isSelected = envType == currentEnv;
          final envColor = _getEnvColor(envType);
          final config = EnvConfig.instance.getConfig(envType);

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {
                  await EnvConfig.instance.switchEnv(envType);
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    _showRestartHint(context, envType);
                  }
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? envColor.withValues(alpha: 0.1)
                        : Colors.grey.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? envColor : Colors.grey.shade300,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 24,
                        decoration: BoxDecoration(
                          color: envColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          envType.label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              envType.displayName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? envColor : Colors.black87,
                              ),
                            ),
                            Text(
                              config.baseUrl,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check_circle,
                          color: envColor,
                          size: 20,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
      ],
    );
  }

  void _showRestartHint(BuildContext context, EnvType newEnv) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('已切换至${newEnv.displayName}，建议重启应用以确保生效'),
        action: SnackBarAction(
          label: '知道了',
          onPressed: () {},
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
