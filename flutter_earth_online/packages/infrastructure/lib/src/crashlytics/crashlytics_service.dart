import 'package:sentry_flutter/sentry_flutter.dart';

/// Crashlytics Service - 崩溃监测服务 (基于 Sentry)
class CrashlyticsService {
  CrashlyticsService._();

  static CrashlyticsService? _instance;

  static CrashlyticsService get instance {
    _instance ??= CrashlyticsService._();
    return _instance!;
  }

  Future<void> init(String dsn) async {
    await SentryFlutter.init(
      (options) {
        options.dsn = dsn;
        // TODO: Configure Sentry options
      },
    );
  }

  Future<void> captureException(
    dynamic exception, {
    StackTrace? stackTrace,
  }) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  }

  Future<void> captureMessage(String message) async {
    await Sentry.captureMessage(message);
  }

  // TODO: Add more crashlytics methods
}
