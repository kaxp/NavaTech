import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tech_nava/constants/app_strings.dart';
import 'package:tech_nava/constants/spacing_constants.dart';
import 'package:tech_nava/modules/home/bloc/home_bloc.dart';
import 'package:tech_nava/modules/home/widgets/albums_list_item.dart';
import 'package:tech_nava/widgets/empty_state_view.dart';
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
          transform: Matrix4.translationValues(
              -kSpacingXSmall, kSpacingZero, kSpacingZero),
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
            EmptyStateView(errorMsg: AppStrings.noDataFound);
          } else if (state is HomeEmpty) {
            EmptyStateView(errorMsg: AppStrings.noResultFound);
          }

          return LoadingOverlay(
            isLoading: state is HomeInitial || state is HomeLoading,
            child: state.albums.isNotEmpty
                ? ListView.builder(
                    itemCount: null, // using null to make infinite scroll
                    itemBuilder: (context, index) {
                      final actualIndex = index % state.albums.length;
                      final album = state.albums[actualIndex];

                      return Column(
                        children: [
                          AlbumsListItem(
                            albums: album,
                          ),
                          const SizedBox(
                            height: kSpacingLarge,
                          ),
                          Divider(
                            height: kSpacingZero,
                            color: Colors.grey[400],
                          ),
                        ],
                      );
                    },
                  )
                : EmptyStateView(
                    errorMsg: AppStrings.noResultFound,
                  ),
          );
        },
      ),
    );
  }
}
