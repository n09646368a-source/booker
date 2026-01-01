import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/ui_components/app_nav_bar.dart';

import 'auto_generated/codegen_loader.g.dart';

void main() {
  runApp(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      // startLocale: SharedStorage.language.locale,
      // fallbackLocale: Language.arabic.locale,
      path: 'assets/l10n',
      supportedLocales: [Locale('en'), Locale('ar')],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AppNavBar());
  }
}
