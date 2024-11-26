import 'package:flutter_modular/flutter_modular.dart';
import 'package:tech_nava/modules/home/home_module.dart';
import 'package:tech_nava/networking/http_client.dart';
import 'package:tech_nava/networking/models/app_dio.dart';

/// [BaseAppModule] is the primary module that will hold all the common
/// dependencies
class BaseAppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<AppDio>(
          (i) => AppDio(
            noAuthDio: httpClient(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          BaseAppModuleRoutes.homePage,
          module: HomeModule(),
        ),
      ];
}

class BaseAppModuleRoutes {
  static const String homePage = '/';
}
