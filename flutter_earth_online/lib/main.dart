import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:main_app/app.dart';
import 'package:main_app/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化各 packages
  await bootstrap();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
