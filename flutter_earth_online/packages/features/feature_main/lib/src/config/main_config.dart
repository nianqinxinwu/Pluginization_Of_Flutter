import 'package:flutter/material.dart';

/// App 布局模式
enum AppLayoutMode {
  /// TabBar 模式 - 底部导航栏
  tabBar,

  /// 单页模式 - 无底部导航栏
  singlePage,
}

/// Tab 项配置
class TabItemConfig {
  const TabItemConfig({
    required this.label,
    required this.icon,
    this.activeIcon,
    this.badge,
  });

  /// Tab 标签文字
  final String label;

  /// 默认图标
  final IconData icon;

  /// 选中图标
  final IconData? activeIcon;

  /// 角标数量 (null 则不显示)
  final int? badge;

  /// 获取选中图标，未设置则使用默认图标
  IconData get selectedIcon => activeIcon ?? icon;
}

/// 主模块配置
class MainModuleConfig {
  const MainModuleConfig({
    this.layoutMode = AppLayoutMode.tabBar,
    this.tabs = const [],
    this.initialIndex = 0,
    this.tabBarType = TabBarType.material,
  });

  /// 布局模式
  final AppLayoutMode layoutMode;

  /// Tab 配置列表 (仅 tabBar 模式有效)
  final List<TabItemConfig> tabs;

  /// 初始选中的 Tab 索引
  final int initialIndex;

  /// TabBar 样式类型
  final TabBarType tabBarType;

  /// 是否为 TabBar 模式
  bool get isTabBarMode => layoutMode == AppLayoutMode.tabBar;

  /// 默认配置 - TabBar 模式
  static MainModuleConfig get defaultTabBar => const MainModuleConfig(
        layoutMode: AppLayoutMode.tabBar,
        tabs: [
          TabItemConfig(
            label: '首页',
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
          ),
          TabItemConfig(
            label: '发现',
            icon: Icons.explore_outlined,
            activeIcon: Icons.explore,
          ),
          TabItemConfig(
            label: '消息',
            icon: Icons.chat_bubble_outline,
            activeIcon: Icons.chat_bubble,
          ),
          TabItemConfig(
            label: '我的',
            icon: Icons.person_outline,
            activeIcon: Icons.person,
          ),
        ],
      );

  /// 默认配置 - 单页模式
  static MainModuleConfig get defaultSinglePage => const MainModuleConfig(
        layoutMode: AppLayoutMode.singlePage,
      );
}

/// TabBar 样式类型
enum TabBarType {
  /// Material 风格
  material,

  /// iOS 风格
  cupertino,

  /// 自定义风格
  custom,
}
