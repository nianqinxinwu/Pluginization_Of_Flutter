import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';

import '../providers/demo_provider.dart';
import '../widgets/index.dart';

/// Demo 首页 - UI展示与网络请求测试
class DemoPage extends ConsumerWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo 测试页'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showEnvInfo(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildEnvCard(),
          const SizedBox(height: 16),
          _buildUITestSection(context),
          const SizedBox(height: 16),
          _buildNetworkTestSection(context, ref),
        ],
      ),
    );
  }

  /// 环境信息卡片
  Widget _buildEnvCard() {
    final env = EnvConfig.instance;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.cloud, size: 20),
                const SizedBox(width: 8),
                Text(
                  '当前环境: ${env.currentEnvType.displayName}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getEnvColor(env.currentEnvType),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    env.currentEnvType.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            _buildEnvInfoRow('Base URL', env.baseUrl),
            _buildEnvInfoRow('AI Service', env.aiServiceUrl),
            _buildEnvInfoRow('Other URL', env.otherBaseUrl),
            _buildEnvInfoRow('WSS URL', env.wssUrl),
          ],
        ),
      ),
    );
  }

  Widget _buildEnvInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 12),
            ),
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

  /// UI 测试区域
  Widget _buildUITestSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'UI 组件测试',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => _showSnackBar(context, 'ElevatedButton 点击'),
                  child: const Text('Elevated'),
                ),
                OutlinedButton(
                  onPressed: () => _showSnackBar(context, 'OutlinedButton 点击'),
                  child: const Text('Outlined'),
                ),
                TextButton(
                  onPressed: () => _showSnackBar(context, 'TextButton 点击'),
                  child: const Text('Text'),
                ),
                FilledButton(
                  onPressed: () => _showSnackBar(context, 'FilledButton 点击'),
                  child: const Text('Filled'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const DemoColorPalette(),
          ],
        ),
      ),
    );
  }

  /// 网络请求测试区域
  Widget _buildNetworkTestSection(BuildContext context, WidgetRef ref) {
    final networkState = ref.watch(demoNetworkProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  '网络请求测试',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (networkState.isLoading)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: networkState.isLoading
                        ? null
                        : () => ref
                            .read(demoNetworkProvider.notifier)
                            .testGetRequest(),
                    icon: const Icon(Icons.download, size: 18),
                    label: const Text('GET 请求'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: networkState.isLoading
                        ? null
                        : () => ref
                            .read(demoNetworkProvider.notifier)
                            .testPostRequest(),
                    icon: const Icon(Icons.upload, size: 18),
                    label: const Text('POST 请求'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '响应结果:',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  networkState.when(
                    data: (result) => Text(
                      result ?? '暂无数据',
                      style: const TextStyle(fontSize: 12),
                    ),
                    loading: () => const Text(
                      '请求中...',
                      style: TextStyle(fontSize: 12),
                    ),
                    error: (error, _) => Text(
                      '错误: $error',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _showEnvInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const EnvSwitchDialog(),
    );
  }
}
