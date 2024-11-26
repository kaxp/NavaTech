import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tech_nava/constants/app_strings.dart';
import 'package:tech_nava/constants/spacing_constants.dart';
import 'package:tech_nava/modules/home/bloc/home_bloc.dart';
import 'package:tech_nava/widgets/loading_overlay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = Modular.get<HomeBloc>();

  @override
  void initState() {
    super.initState();
    _homeBloc.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          transform: Matrix4.translationValues(-kSpacingXSmall, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: kSpacingSmall,
              ),
              Text(
                AppStrings.appName,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: _homeBloc,
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
              ),
              duration: const Duration(seconds: 5),
            ));
          }
        },
        builder: (context, state) {
          if (state is HomeError) {
            // TODO(kaxp): Handle error UI
          } else if (state is HomeEmpty) {
            // TODO(kaxp): Show empty data
          }

          return LoadingOverlay(
            isLoading: state is HomeInitial || state is HomeLoading,
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: const [
                // TODO(kaxp): Create UI
                Text("Some date")
              ],
            ),
          );
        },
      ),
    );
  }
}
