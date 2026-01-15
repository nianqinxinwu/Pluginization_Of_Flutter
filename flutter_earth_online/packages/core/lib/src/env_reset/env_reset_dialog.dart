import 'package:flutter/material.dart';

import '../config/env_config.dart';

/// Env Reset Dialog - 环境配置重置对话框 (仅 Debug 模式可用)
/// @deprecated 请使用 [EnvSwitchDialog] 代替
@Deprecated('Use EnvSwitchDialog instead')
class EnvResetDialog extends StatelessWidget {
  const EnvResetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('环境配置'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: EnvType.values.map((envType) {
          return ListTile(
            title: Text(envType.displayName),
            subtitle: Text(EnvConfig.instance.getConfig(envType).baseUrl),
            selected: EnvConfig.instance.currentEnvType == envType,
            onTap: () async {
              await EnvConfig.instance.switchEnv(envType);
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
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
}
