import 'package:core/core.dart';
import 'package:infrastructure/infrastructure.dart';

/// Bootstrap - 负责各 packages 的初始化顺序
Future<void> bootstrap() async {
  // 1. 初始化日志服务
  InfraLogger.instance.init();

  // 2. 初始化环境配置 (默认开发环境，可根据构建配置修改)
  await EnvConfig.instance.init(defaultEnv: EnvType.development);

  // 3. 初始化网络服务
  // DioClient.instance.init();

  // 4. 初始化崩溃监测 (可选)
  // await CrashlyticsService.instance.init('YOUR_SENTRY_DSN');

  InfraLogger.instance.info('Bootstrap completed');
  InfraLogger.instance.info('Current env: ${EnvConfig.instance.currentEnvType.displayName}');
}
