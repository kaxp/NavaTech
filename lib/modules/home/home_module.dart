import 'package:flutter_modular/flutter_modular.dart';
import 'package:tech_nava/modules/app/base_app_module.dart';
import 'package:tech_nava/modules/home/bloc/home_bloc.dart';
import 'package:tech_nava/modules/home/pages/home_page.dart';
import 'package:tech_nava/modules/home/repositories/home_repo.dart';

class HomeModule extends BaseAppModule {
  @override
  List<Bind> get binds => [
        Bind<HomeRepo>((_) => HomeRepo()),
        Bind<HomeBloc>((_) => HomeBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
        ),
      ];
}

class HomeRoute {
  static const String moduleRoute = '/';
}
