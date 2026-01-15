import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:feature_demo/feature_demo.dart';

/// 我的页面 (包含设置入口)
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => _navigateToSettings(context),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildUserHeader(context),
          const SizedBox(height: 16),
          _buildMenuSection(context),
          const SizedBox(height: 16),
          _buildDeveloperSection(context),
        ],
      ),
    );
  }

  Widget _buildUserHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.blue.shade100,
            child: const Icon(Icons.person, size: 40, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Flutter 开发者',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: 10086',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    final menuItems = [
      {'icon': Icons.favorite_outline, 'label': '我的收藏', 'color': Colors.red},
      {'icon': Icons.history, 'label': '浏览记录', 'color': Colors.orange},
      {'icon': Icons.download_outlined, 'label': '我的下载', 'color': Colors.green},
      {'icon': Icons.card_giftcard, 'label': '我的优惠', 'color': Colors.purple},
    ];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: menuItems.map((item) {
          return ListTile(
            leading: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: (item['color'] as Color).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                item['icon'] as IconData,
                color: item['color'] as Color,
                size: 20,
              ),
            ),
            title: Text(item['label'] as String),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('点击了 ${item['label']}')),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDeveloperSection(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              '开发者选项',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            leading: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.science_outlined,
                color: Colors.blue,
                size: 20,
              ),
            ),
            title: const Text('样例'),
            subtitle: const Text('UI展示与网络请求测试'),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () => _navigateToDemo(context),
          ),
          ListTile(
            leading: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.swap_horiz,
                color: Colors.orange,
                size: 20,
              ),
            ),
            title: const Text('环境切换'),
            subtitle: Text(EnvConfig.instance.currentEnvType.displayName),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getEnvColor(EnvConfig.instance.currentEnvType),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                EnvConfig.instance.currentEnvType.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: () => _showEnvSwitchDialog(context),
          ),
          ListTile(
            leading: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.settings_outlined,
                color: Colors.green,
                size: 20,
              ),
            ),
            title: const Text('设置'),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () => _navigateToSettings(context),
          ),
        ],
      ),
    );
  }

  Color _getEnvColor(EnvType envType) {
    switch (envType) {
      case EnvType.development:
        return const Color(0xFF4CAF50);
      case EnvType.test:
        return const Color(0xFFFF9800);
      case EnvType.production:
        return const Color(0xFF9C27B0);
      case EnvType.release:
        return const Color(0xFF2196F3);
    }
  }

  void _navigateToDemo(BuildContext context) {
    // 使用 AutoRouter 跳转
    context.router.pushNamed('/demo');
  }

  void _navigateToSettings(BuildContext context) {
    // 使用 AutoRouter 跳转
    context.router.pushNamed('/settings');
  }

  void _showEnvSwitchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const EnvSwitchDialog(),
    );
  }
}

/// 设置页面
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(localeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSection(
            title: '通用设置',
            children: [
              ListTile(
                leading: Icon(Icons.language, color: Colors.grey.shade600),
                title: const Text('语言'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      currentLanguage.nativeName,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
                onTap: () => _showLanguageDialog(context),
              ),
              _buildSettingItem(
                icon: Icons.dark_mode_outlined,
                label: '深色模式',
                trailing: Switch(
                  value: false,
                  onChanged: (_) {},
                ),
              ),
              _buildSettingItem(
                icon: Icons.notifications_outlined,
                label: '通知设置',
                onTap: () {},
              ),
            ],
          ),
          _buildSection(
            title: '隐私与安全',
            children: [
              _buildSettingItem(
                icon: Icons.lock_outline,
                label: '账号安全',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.privacy_tip_outlined,
                label: '隐私设置',
                onTap: () {},
              ),
            ],
          ),
          _buildSection(
            title: '关于',
            children: [
              _buildSettingItem(
                icon: Icons.info_outline,
                label: '关于我们',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.description_outlined,
                label: '用户协议',
                onTap: () {},
              ),
              _buildSettingItem(
                icon: Icons.update,
                label: '检查更新',
                value: '当前版本 1.0.0',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('退出登录')),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('退出登录'),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const LanguageSwitchDialog(),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String label,
    String? value,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade600),
      title: Text(label),
      trailing: trailing ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (value != null)
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                  ),
                ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
      onTap: onTap,
    );
  }
}
