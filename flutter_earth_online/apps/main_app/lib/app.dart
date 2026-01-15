import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';

import 'src/router/app_router.dart';

/// App - MaterialApp 容器
/// 配置：主题、多语言、路由、环境切换
class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // 监听语言状态
    final language = ref.watch(localeNotifierProvider);

    // 获取系统语言
    final systemLocale = View.of(context).platformDispatcher.locale;

    // 解析最终使用的语言
    final resolvedLocale = LocaleConfig.resolveLocale(language, systemLocale);

    return MaterialApp.router(
      title: 'Flutter Earth Online',
      debugShowCheckedModeBanner: false,

      // 主题配置
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      // 多语言配置
      locale: resolvedLocale,
      localizationsDelegates: AppLocalizationConfig.localizationsDelegates,
      supportedLocales: AppLocalizationConfig.supportedLocales,
      localeResolutionCallback: AppLocalizationConfig.localeResolutionCallback,

      // AutoRouter 配置
      routerConfig: _appRouter.config(),

      // 环境切换悬浮按钮 (通过 builder 包裹所有页面)
      builder: (context, child) {
        return EnvSwitchButton(
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
