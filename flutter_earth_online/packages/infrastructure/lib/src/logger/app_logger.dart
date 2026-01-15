import 'package:talker/talker.dart';

/// App Logger - 日志服务 (基于 Talker)
class InfraLogger {
  InfraLogger._();

  static InfraLogger? _instance;
  late Talker _talker;

  static InfraLogger get instance {
    _instance ??= InfraLogger._();
    return _instance!;
  }

  Talker get talker => _talker;

  void init() {
    _talker = Talker();
  }

  void debug(String message) {
    _talker.debug(message);
  }

  void info(String message) {
    _talker.info(message);
  }

  void warning(String message) {
    _talker.warning(message);
  }

  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _talker.error(message, error, stackTrace);
  }

  // TODO: Add more logger methods
}
