import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/main_config.dart';

/// 底部导航栏组件
class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
    this.type = TabBarType.material,
  });

  /// 当前选中索引
  final int currentIndex;

  /// Tab 配置列表
  final List<TabItemConfig> items;

  /// 点击回调
  final ValueChanged<int> onTap;

  /// 导航栏类型
  final TabBarType type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TabBarType.material:
        return _buildMaterialNavigationBar(context);
      case TabBarType.cupertino:
        return _buildCupertinoNavigationBar(context);
      case TabBarType.custom:
        return _buildCustomNavigationBar(context);
    }
  }

  /// Material 风格导航栏
  Widget _buildMaterialNavigationBar(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: items.map((item) {
        return NavigationDestination(
          icon: _buildIcon(item.icon, item.badge),
          selectedIcon: _buildIcon(item.selectedIcon, item.badge),
          label: item.label,
        );
      }).toList(),
    );
  }

  /// iOS 风格导航栏
  Widget _buildCupertinoNavigationBar(BuildContext context) {
    return CupertinoTabBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items.map((item) {
        return BottomNavigationBarItem(
          icon: _buildIcon(item.icon, item.badge),
          activeIcon: _buildIcon(item.selectedIcon, item.badge),
          label: item.label,
        );
      }).toList(),
    );
  }

  /// 自定义风格导航栏
  Widget _buildCustomNavigationBar(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 64 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == currentIndex;

          return Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? theme.colorScheme.primary.withValues(alpha: 0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: _buildIcon(
                      isSelected ? item.selectedIcon : item.icon,
                      item.badge,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 11,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : Colors.grey.shade600,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  /// 构建带角标的图标
  Widget _buildIcon(IconData icon, int? badge, {Color? color}) {
    final iconWidget = Icon(icon, color: color);

    if (badge == null || badge <= 0) {
      return iconWidget;
    }

    return Badge(
      label: badge > 99 ? const Text('99+') : Text('$badge'),
      child: iconWidget,
    );
  }
}
