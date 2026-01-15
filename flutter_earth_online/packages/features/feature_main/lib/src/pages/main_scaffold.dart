import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/main_config.dart';
import '../providers/main_provider.dart';
import '../widgets/index.dart';
import 'home_page.dart';
import 'discover_page.dart';
import 'message_page.dart';
import 'profile_page.dart';

/// 主框架页面 - 支持 TabBar/非TabBar 两种模式
class MainScaffold extends ConsumerStatefulWidget {
  const MainScaffold({
    super.key,
    this.config,
  });

  /// 配置，为空则使用默认配置
  final MainModuleConfig? config;

  @override
  ConsumerState<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    final config = widget.config ?? MainModuleConfig.defaultTabBar;
    _pageController = PageController(initialPage: config.initialIndex);

    // 初始化配置
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.config != null) {
        ref.read(mainConfigProvider.notifier).updateConfig(widget.config!);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Tab 对应的页面
  List<Widget> get _pages => const [
        HomePage(),
        DiscoverPage(),
        MessagePage(),
        ProfilePage(),
      ];

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(mainConfigProvider);
    final currentIndex = ref.watch(currentTabIndexProvider);

    // 非 TabBar 模式
    if (!config.isTabBarMode) {
      return const HomePage();
    }

    // TabBar 模式
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: currentIndex,
        items: config.tabs,
        type: config.tabBarType,
        onTap: (index) {
          ref.read(currentTabIndexProvider.notifier).switchTab(index);
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
