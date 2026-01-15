import 'package:flutter/material.dart';

/// 全局 Context 管理器
///
/// 提供全局访问 BuildContext 和 NavigatorState 的能力
/// 用于在非 Widget 环境中（如网络请求、服务层）显示弹框、导航等
///
/// 使用方式：
/// 1. 在 MaterialApp 中配置 navigatorKey：
/// ```dart
/// MaterialApp.router(
///   routerConfig: _appRouter.config(
///     navigatorObservers: () => [AppNavigator.observer],
///   ),
/// )
/// ```
///
/// 2. 或者使用普通 MaterialApp：
/// ```dart
/// MaterialApp(
///   navigatorKey: AppNavigator.key,
///   navigatorObservers: [AppNavigator.observer],
/// )
/// ```
///
/// 3. 在任意位置使用：
/// ```dart
/// // 获取全局 context
/// final context = AppNavigator.context;
///
/// // 显示弹框
/// AppNavigator.showDialog(
///   builder: (context) => AlertDialog(...),
/// );
///
/// // 显示 Loading
/// Loading.show(AppNavigator.context);
/// ```
class AppNavigator {
  AppNavigator._();

  /// 全局 NavigatorKey
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  /// 路由观察者
  static final RouteObserver<ModalRoute<void>> observer =
      RouteObserver<ModalRoute<void>>();

  /// 获取全局 NavigatorState
  static NavigatorState? get navigator => key.currentState;

  /// 获取全局 BuildContext
  ///
  /// 注意：在应用初始化完成前可能为 null
  static BuildContext? get context => key.currentContext;

  /// 获取全局 BuildContext（非空版本）
  ///
  /// 如果 context 为空会抛出异常
  static BuildContext get currentContext {
    final ctx = context;
    if (ctx == null) {
      throw StateError(
        'AppNavigator.context is null. '
        'Make sure to configure navigatorKey in MaterialApp.',
      );
    }
    return ctx;
  }

  /// 获取 Overlay
  static OverlayState? get overlay => navigator?.overlay;

  // ==================== 导航方法 ====================

  /// 跳转到新页面
  static Future<T?> push<T extends Object?>(Route<T> route) {
    return navigator!.push(route);
  }

  /// 跳转到新页面（命名路由）
  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return navigator!.pushNamed(routeName, arguments: arguments);
  }

  /// 替换当前页面
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> newRoute, {
    TO? result,
  }) {
    return navigator!.pushReplacement(newRoute, result: result);
  }

  /// 返回上一页
  static void pop<T extends Object?>([T? result]) {
    navigator!.pop(result);
  }

  /// 返回到指定页面
  static void popUntil(RoutePredicate predicate) {
    navigator!.popUntil(predicate);
  }

  /// 返回到根页面
  static void popToRoot() {
    navigator!.popUntil((route) => route.isFirst);
  }

  /// 是否可以返回
  static bool canPop() {
    return navigator!.canPop();
  }

  /// 尝试返回
  static Future<bool> maybePop<T extends Object?>([T? result]) {
    return navigator!.maybePop(result);
  }

  // ==================== 弹框方法 ====================

  /// 显示对话框
  static Future<T?> showDialog<T>({
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
  }) {
    return showGeneralDialog<T>(
      context: currentContext,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel ?? '',
      barrierColor: barrierColor ?? Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
        );
      },
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
    );
  }

  /// 显示确认对话框
  static Future<bool?> showConfirmDialog({
    String? title,
    String? content,
    String? confirmText,
    String? cancelText,
    Color? confirmColor,
    bool barrierDismissible = true,
  }) {
    return showDialog<bool>(
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText ?? '取消'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: confirmColor ?? Theme.of(context).primaryColor,
            ),
            child: Text(confirmText ?? '确定'),
          ),
        ],
      ),
    );
  }

  /// 显示底部弹窗
  static Future<T?> showBottomSheet<T>({
    required WidgetBuilder builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
  }) {
    return showModalBottomSheet<T>(
      context: currentContext,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      useSafeArea: useSafeArea,
      routeSettings: routeSettings,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
    );
  }

  /// 显示 SnackBar
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 2),
    SnackBarAction? action,
    Color? backgroundColor,
    SnackBarBehavior? behavior,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: duration,
      action: action,
      backgroundColor: backgroundColor,
      behavior: behavior ?? SnackBarBehavior.floating,
    );
    return ScaffoldMessenger.of(currentContext).showSnackBar(snackBar);
  }

  /// 隐藏当前 SnackBar
  static void hideCurrentSnackBar() {
    ScaffoldMessenger.of(currentContext).hideCurrentSnackBar();
  }
}

/// 便捷别名
typedef GlobalContext = AppNavigator;
