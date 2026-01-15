import 'package:flutter/material.dart';

/// 加载提示工具类
///
/// 提供全局 Loading、Toast、成功/错误提示功能
///
/// 使用方式：
/// ```dart
/// // 显示 Loading
/// Loading.show(context);
/// // 关闭 Loading
/// Loading.dismiss();
///
/// // 显示 Toast
/// Loading.toast(context, '操作成功');
///
/// // 显示成功/错误提示
/// Loading.success(context, text: '保存成功');
/// Loading.error(context, text: '保存失败');
/// ```
class Loading {
  Loading._();

  static OverlayEntry? _overlayEntry;
  static bool _isShowing = false;

  /// 配置参数
  static const int _dismissMilliseconds = 2000;

  /// 显示 Loading
  static void show(BuildContext context, {String? text}) {
    if (_isShowing) return;
    _isShowing = true;

    _overlayEntry = OverlayEntry(
      builder: (context) => _LoadingOverlay(text: text ?? 'Loading...'),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  /// 关闭 Loading
  static void dismiss() {
    if (!_isShowing) return;
    _isShowing = false;

    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  /// 显示成功提示
  static void success(BuildContext context, {String? text}) {
    _showMessage(
      context,
      text: text ?? 'Success',
      icon: Icons.check_circle,
      color: Colors.green,
    );
  }

  /// 显示错误提示
  static void error(BuildContext context, {String? text}) {
    _showMessage(
      context,
      text: text ?? 'Error',
      icon: Icons.error,
      color: Colors.red,
    );
  }

  /// 显示警告提示
  static void warning(BuildContext context, {String? text}) {
    _showMessage(
      context,
      text: text ?? 'Warning',
      icon: Icons.warning,
      color: Colors.orange,
    );
  }

  /// 显示 Toast
  static void toast(BuildContext context, String text) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => _ToastWidget(
        text: text,
        onDismiss: () => entry.remove(),
      ),
    );

    overlay.insert(entry);
  }

  /// 显示带图标的消息
  static void _showMessage(
    BuildContext context, {
    required String text,
    required IconData icon,
    required Color color,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => _MessageWidget(
        text: text,
        icon: icon,
        color: color,
        onDismiss: () => entry.remove(),
      ),
    );

    overlay.insert(entry);
  }
}

/// Loading 遮罩组件
class _LoadingOverlay extends StatelessWidget {
  final String text;

  const _LoadingOverlay({required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.5),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Toast 组件
class _ToastWidget extends StatefulWidget {
  final String text;
  final VoidCallback onDismiss;

  const _ToastWidget({
    required this.text,
    required this.onDismiss,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _controller.reverse().then((_) => widget.onDismiss());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.15,
      left: 0,
      right: 0,
      child: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 消息提示组件
class _MessageWidget extends StatefulWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onDismiss;

  const _MessageWidget({
    required this.text,
    required this.icon,
    required this.color,
    required this.onDismiss,
  });

  @override
  State<_MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<_MessageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _controller.reverse().then((_) => widget.onDismiss());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(widget.icon, color: widget.color, size: 36),
                const SizedBox(height: 8),
                Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 便捷别名
typedef AppLoading = Loading;
