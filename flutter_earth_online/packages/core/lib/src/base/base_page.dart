import 'package:flutter/material.dart';
import '../utils/navigator.dart';

/// 页面生命周期状态
enum PageLifecycleState {
  /// 页面创建
  created,

  /// 页面首次可见（首次进入）
  firstVisible,

  /// 页面可见（从其他页面返回）
  visible,

  /// 页面不可见（被其他页面覆盖）
  invisible,

  /// 页面销毁
  disposed,
}

/// 页面生命周期基类
///
/// 提供完整的页面生命周期管理，包括：
/// - 页面首次进入/再次进入的区分
/// - 页面可见/不可见状态监听
/// - 应用前后台切换监听
/// - 埋点和接口调用的统一入口
///
/// 使用示例：
/// ```dart
/// class MyPage extends BasePage {
///   const MyPage({super.key});
///
///   @override
///   BasePageState<MyPage> createState() => _MyPageState();
/// }
///
/// class _MyPageState extends BasePageState<MyPage> {
///   @override
///   void onPageInit() {
///     // 页面初始化，只执行一次
///     // 适合初始化控制器、变量等
///   }
///
///   @override
///   void onPageFirstShow() {
///     // 页面首次显示，只执行一次
///     // 适合首次加载数据、埋点页面曝光
///     _loadData();
///   }
///
///   @override
///   void onPageShow() {
///     // 页面每次显示都会调用（包括首次）
///     // 适合刷新数据、恢复动画等
///   }
///
///   @override
///   void onPageHide() {
///     // 页面隐藏时调用
///     // 适合暂停动画、保存状态等
///   }
///
///   @override
///   Widget buildPage(BuildContext context) {
///     return Scaffold(...);
///   }
/// }
/// ```
abstract class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  BasePageState createState();
}

/// 页面状态基类
abstract class BasePageState<T extends BasePage> extends State<T>
    with RouteAware, WidgetsBindingObserver {
  /// 当前生命周期状态
  PageLifecycleState _lifecycleState = PageLifecycleState.created;

  /// 是否是首次显示
  bool _isFirstShow = true;

  /// 是否已经调用过 onPageFirstShow
  bool _hasCalledFirstShow = false;

  /// 页面是否可见
  bool _isPageVisible = false;

  /// 应用是否在前台
  bool _isAppForeground = true;

  /// 获取当前生命周期状态
  PageLifecycleState get lifecycleState => _lifecycleState;

  /// 页面是否可见
  bool get isPageVisible => _isPageVisible;

  /// 是否是首次显示
  bool get isFirstShow => _isFirstShow;

  /// 应用是否在前台
  bool get isAppForeground => _isAppForeground;

  // ==================== 生命周期回调 ====================

  /// 页面初始化
  ///
  /// 在 initState 之后立即调用，只执行一次
  /// 适合初始化控制器、变量、监听器等
  @protected
  void onPageInit() {}

  /// 页面首次显示
  ///
  /// 页面第一次变为可见时调用，只执行一次
  /// 适合首次加载数据、埋点页面曝光等
  @protected
  void onPageFirstShow() {}

  /// 页面显示
  ///
  /// 每次页面变为可见时调用（包括首次显示和从其他页面返回）
  /// 适合刷新数据、恢复动画等
  @protected
  void onPageShow() {}

  /// 页面隐藏
  ///
  /// 页面变为不可见时调用（被其他页面覆盖或应用进入后台）
  /// 适合暂停动画、保存临时状态等
  @protected
  void onPageHide() {}

  /// 页面销毁前
  ///
  /// 在 dispose 之前调用
  /// 适合清理资源、取消订阅等
  @protected
  void onPageDispose() {}

  /// 应用进入前台
  ///
  /// 当应用从后台切换到前台时调用
  @protected
  void onAppForeground() {}

  /// 应用进入后台
  ///
  /// 当应用从前台切换到后台时调用
  @protected
  void onAppBackground() {}

  /// 页面从其他页面返回
  ///
  /// 当从其他页面 pop 回来时调用（不包括首次进入）
  /// 适合刷新列表数据等
  @protected
  void onPageResume() {}

  /// 页面被其他页面覆盖
  ///
  /// 当 push 到其他页面时调用
  /// 适合暂停某些操作
  @protected
  void onPagePause() {}

  // ==================== 构建方法 ====================

  /// 构建页面内容
  ///
  /// 子类必须实现此方法来构建页面 UI
  @protected
  Widget buildPage(BuildContext context);

  /// 构建加载中状态（可选覆盖）
  @protected
  Widget buildLoading(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  /// 构建错误状态（可选覆盖）
  @protected
  Widget buildError(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text('加载失败: $error'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onPageFirstShow,
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  // ==================== 内部实现 ====================

  @override
  void initState() {
    super.initState();
    _lifecycleState = PageLifecycleState.created;

    // 注册应用生命周期监听
    WidgetsBinding.instance.addObserver(this);

    // 调用页面初始化
    onPageInit();

    // 延迟到第一帧渲染后触发首次显示
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleFirstShow();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 注册路由监听
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      AppNavigator.observer.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    _lifecycleState = PageLifecycleState.disposed;

    // 调用页面销毁前回调
    onPageDispose();

    // 取消路由监听
    AppNavigator.observer.unsubscribe(this);

    // 取消应用生命周期监听
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildPage(context);
  }

  // ==================== RouteAware 回调 ====================

  /// 页面第一次被 push 到栈顶时调用
  @override
  void didPush() {
    // didPush 在 addPostFrameCallback 之前调用
    // 首次显示的处理已在 addPostFrameCallback 中处理
  }

  /// 从其他页面 pop 回来，当前页面重新显示
  @override
  void didPopNext() {
    _isPageVisible = true;
    _lifecycleState = PageLifecycleState.visible;

    onPageResume();
    onPageShow();
  }

  /// 当前页面被 pop 出栈
  @override
  void didPop() {
    _isPageVisible = false;
    _lifecycleState = PageLifecycleState.invisible;

    onPageHide();
  }

  /// 新页面被 push，当前页面被覆盖
  @override
  void didPushNext() {
    _isPageVisible = false;
    _lifecycleState = PageLifecycleState.invisible;

    onPagePause();
    onPageHide();
  }

  // ==================== WidgetsBindingObserver 回调 ====================

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        _isAppForeground = true;
        onAppForeground();
        // 如果页面之前是可见的，触发 onPageShow
        if (_isPageVisible) {
          onPageShow();
        }
        break;

      case AppLifecycleState.paused:
        _isAppForeground = false;
        // 如果页面当前是可见的，触发 onPageHide
        if (_isPageVisible) {
          onPageHide();
        }
        onAppBackground();
        break;

      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  // ==================== 私有方法 ====================

  /// 处理首次显示
  void _handleFirstShow() {
    if (!mounted) return;
    if (_hasCalledFirstShow) return;

    _hasCalledFirstShow = true;
    _isPageVisible = true;
    _lifecycleState = PageLifecycleState.firstVisible;

    onPageFirstShow();
    onPageShow();

    _isFirstShow = false;
  }
}

/// 带自动加载的页面基类
///
/// 提供自动数据加载功能，简化常见的数据加载场景
///
/// 使用示例：
/// ```dart
/// class MyPage extends BaseLoadablePage {
///   const MyPage({super.key});
///
///   @override
///   BaseLoadablePageState<MyPage> createState() => _MyPageState();
/// }
///
/// class _MyPageState extends BaseLoadablePageState<MyPage> {
///   List<Item> _items = [];
///
///   @override
///   Future<void> loadData() async {
///     final result = await api.fetchItems();
///     setState(() => _items = result);
///   }
///
///   @override
///   Widget buildContent(BuildContext context) {
///     return ListView.builder(
///       itemCount: _items.length,
///       itemBuilder: (context, index) => ItemTile(_items[index]),
///     );
///   }
/// }
/// ```
abstract class BaseLoadablePage extends BasePage {
  const BaseLoadablePage({super.key});

  @override
  BaseLoadablePageState createState();
}

/// 带自动加载的页面状态基类
abstract class BaseLoadablePageState<T extends BaseLoadablePage>
    extends BasePageState<T> {
  /// 加载状态
  bool _isLoading = false;

  /// 错误信息
  Object? _error;

  /// 是否正在加载
  bool get isLoading => _isLoading;

  /// 是否有错误
  bool get hasError => _error != null;

  /// 错误信息
  Object? get error => _error;

  /// 加载数据
  ///
  /// 子类实现此方法来加载数据
  @protected
  Future<void> loadData();

  /// 构建内容
  ///
  /// 子类实现此方法来构建加载完成后的内容
  @protected
  Widget buildContent(BuildContext context);

  /// 是否在首次显示时自动加载
  @protected
  bool get autoLoadOnFirstShow => true;

  /// 是否在页面恢复时自动刷新
  @protected
  bool get autoRefreshOnResume => false;

  @override
  void onPageFirstShow() {
    super.onPageFirstShow();
    if (autoLoadOnFirstShow) {
      refresh();
    }
  }

  @override
  void onPageResume() {
    super.onPageResume();
    if (autoRefreshOnResume) {
      refresh();
    }
  }

  /// 刷新数据
  Future<void> refresh() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await loadData();
    } catch (e) {
      _error = e;
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget buildPage(BuildContext context) {
    if (_isLoading && _error == null) {
      return buildLoading(context);
    }

    if (_error != null) {
      return buildError(context, _error!);
    }

    return buildContent(context);
  }

  @override
  Widget buildError(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text('加载失败: $error'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: refresh,
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }
}

/// 页面埋点 Mixin
///
/// 提供统一的埋点接口，可与 BasePage 配合使用
///
/// 使用示例：
/// ```dart
/// class _MyPageState extends BasePageState<MyPage> with PageTrackingMixin {
///   @override
///   String get pageName => 'my_page';
///
///   @override
///   Map<String, dynamic>? get pageParams => {'source': 'home'};
/// }
/// ```
mixin PageTrackingMixin<T extends BasePage> on BasePageState<T> {
  /// 页面名称（用于埋点）
  String get pageName;

  /// 页面参数（用于埋点）
  Map<String, dynamic>? get pageParams => null;

  /// 埋点服务（子类可覆盖以使用自定义埋点服务）
  @protected
  void trackPageView(String pageName, Map<String, dynamic>? params) {
    // 默认实现：打印日志
    // 实际项目中应该调用埋点 SDK
    debugPrint('[PageTrack] View: $pageName, params: $params');
  }

  /// 埋点页面离开
  @protected
  void trackPageLeave(String pageName, Duration duration) {
    debugPrint('[PageTrack] Leave: $pageName, duration: ${duration.inSeconds}s');
  }

  DateTime? _pageShowTime;

  @override
  void onPageFirstShow() {
    super.onPageFirstShow();
    _pageShowTime = DateTime.now();
    trackPageView(pageName, pageParams);
  }

  @override
  void onPageHide() {
    super.onPageHide();
    if (_pageShowTime != null) {
      final duration = DateTime.now().difference(_pageShowTime!);
      trackPageLeave(pageName, duration);
    }
  }

  @override
  void onPageShow() {
    super.onPageShow();
    if (!isFirstShow) {
      _pageShowTime = DateTime.now();
    }
  }
}
