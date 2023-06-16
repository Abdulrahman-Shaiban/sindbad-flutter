import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/utils/initializer.dart';
import 'sindebad_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
      const ProviderScope(
        child: SindebadApp(),
      ),
  );
}
