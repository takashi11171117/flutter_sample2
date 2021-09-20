import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'models/example.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 縦固定
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Hive.initFlutter();
  Hive.registerAdapter(ExampleAdapter());
  await Hive.openBox<Example>('examples');

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
