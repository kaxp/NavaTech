import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tech_nava/config/themes/app_theme.dart';
import 'package:tech_nava/constants/widget_keys.dart';
import 'package:tech_nava/modules/app/base_app_module.dart';
import 'package:tech_nava/modules/app/db/hive_initializer.dart';

void main() async {
  // Initialize widget binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize localization
  await EasyLocalization.ensureInitialized();

  // Initialize hive for local caching
  await HiveInitializer.initHive();

  runApp(
    ModularApp(
      module: BaseAppModule(),
      child: EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'i18n',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      title: 'NavaTech',
      theme: AppTheme.defaultTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: WidgetKeys.rootScaffoldMessengerKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
