import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'locale_config.dart';
import 'locale_provider.dart';

/// 语言切换对话框
class LanguageSwitchDialog extends ConsumerWidget {
  const LanguageSwitchDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(localeNotifierProvider);

    return AlertDialog(
      title: const Text('选择语言'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: AppLanguage.values.map((language) {
          final isSelected = language == currentLanguage;

          return RadioListTile<AppLanguage>(
            title: Text(language.nativeName),
            subtitle: language == AppLanguage.system
                ? Text(
                    _getSystemLanguageHint(context),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  )
                : null,
            value: language,
            groupValue: currentLanguage,
            onChanged: (value) {
              if (value != null) {
                ref.read(localeNotifierProvider.notifier).setLanguage(value);
                Navigator.of(context).pop(value);
              }
            },
            selected: isSelected,
            activeColor: Theme.of(context).colorScheme.primary,
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

  String _getSystemLanguageHint(BuildContext context) {
    final systemLocale = View.of(context).platformDispatcher.locale;
    final resolved = LocaleConfig.resolveLocale(AppLanguage.system, systemLocale);
    final language = LocaleConfig.fromLocale(resolved);
    return '当前系统: ${language.nativeName}';
  }
}

/// 语言切换列表项
class LanguageSwitchTile extends ConsumerWidget {
  const LanguageSwitchTile({
    super.key,
    this.leading,
    this.showCurrentLanguage = true,
  });

  /// 前置图标
  final Widget? leading;

  /// 是否显示当前语言
  final bool showCurrentLanguage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(localeNotifierProvider);

    return ListTile(
      leading: leading ??
          Icon(Icons.language, color: Colors.grey.shade600),
      title: const Text('语言'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showCurrentLanguage)
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
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const LanguageSwitchDialog(),
    );
  }
}

/// 语言选择器下拉菜单
class LanguageDropdown extends ConsumerWidget {
  const LanguageDropdown({
    super.key,
    this.decoration,
  });

  /// 装饰样式
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(localeNotifierProvider);

    return DropdownButtonFormField<AppLanguage>(
      value: currentLanguage,
      decoration: decoration ??
          const InputDecoration(
            labelText: '语言',
            border: OutlineInputBorder(),
          ),
      items: AppLanguage.values.map((language) {
        return DropdownMenuItem(
          value: language,
          child: Text(language.nativeName),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          ref.read(localeNotifierProvider.notifier).setLanguage(value);
        }
      },
    );
  }
}
