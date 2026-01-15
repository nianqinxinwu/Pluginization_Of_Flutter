import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:feature_main/feature_main.dart' as main_feature;
import 'package:feature_demo/feature_demo.dart' as demo_feature;
import 'package:core/core.dart';

part 'app_router.gr.dart';

/// App Router - 应用路由配置
@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  GlobalKey<NavigatorState> get navigatorKey => globalNavigatorKey;

  @override
  List<AutoRoute> get routes => [
        // 主框架 (初始路由)
        AutoRoute(
          path: '/',
          page: MainWrapperRoute.page,
          initial: true,
        ),

        // 独立页面路由
        AutoRoute(path: '/settings', page: SettingsWrapperRoute.page),
        AutoRoute(path: '/demo', page: DemoWrapperRoute.page),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
}

//==============================================================================
// 路由页面包装器
// 使用 Wrapper 后缀避免与 feature 模块中的页面类名冲突
//==============================================================================

/// 主框架路由包装
@RoutePage()
class MainWrapperScreen extends StatelessWidget {
  const MainWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const main_feature.MainScaffold();
  }
}

/// 设置页路由包装
@RoutePage()
class SettingsWrapperScreen extends StatelessWidget {
  const SettingsWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const main_feature.SettingsPage();
  }
}

/// Demo 页路由包装
@RoutePage()
class DemoWrapperScreen extends StatelessWidget {
  const DemoWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const demo_feature.DemoPage();
  }
}
