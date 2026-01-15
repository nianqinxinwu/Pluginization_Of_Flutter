import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/main_config.dart';

part 'main_provider.g.dart';

/// 当前 Tab 索引状态
@riverpod
class CurrentTabIndex extends _$CurrentTabIndex {
  @override
  int build() => 0;

  /// 切换 Tab
  void switchTab(int index) {
    state = index;
  }
}

/// 主模块配置状态
@riverpod
class MainConfig extends _$MainConfig {
  @override
  MainModuleConfig build() => MainModuleConfig.defaultTabBar;

  /// 切换布局模式
  void switchLayoutMode(AppLayoutMode mode) {
    if (mode == AppLayoutMode.tabBar) {
      state = MainModuleConfig.defaultTabBar;
    } else {
      state = MainModuleConfig.defaultSinglePage;
    }
  }

  /// 更新配置
  void updateConfig(MainModuleConfig config) {
    state = config;
  }

  /// 更新 Tab 角标
  void updateTabBadge(int tabIndex, int? badge) {
    if (tabIndex < 0 || tabIndex >= state.tabs.length) return;

    final updatedTabs = List<TabItemConfig>.from(state.tabs);
    final oldTab = updatedTabs[tabIndex];
    updatedTabs[tabIndex] = TabItemConfig(
      label: oldTab.label,
      icon: oldTab.icon,
      activeIcon: oldTab.activeIcon,
      badge: badge,
    );

    state = MainModuleConfig(
      layoutMode: state.layoutMode,
      tabs: updatedTabs,
      initialIndex: state.initialIndex,
      tabBarType: state.tabBarType,
    );
  }
}

/// Tab 页面 KeepAlive 状态
@riverpod
class TabKeepAlive extends _$TabKeepAlive {
  @override
  List<bool> build() => [true, true, true, true];

  /// 设置某个 Tab 是否保持状态
  void setKeepAlive(int index, bool keepAlive) {
    if (index < 0 || index >= state.length) return;
    state = [
      for (int i = 0; i < state.length; i++)
        i == index ? keepAlive : state[i],
    ];
  }
}
