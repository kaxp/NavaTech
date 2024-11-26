import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:tech_nava/modules/home/models/albums_response.dart';
import 'package:tech_nava/modules/home/repositories/home_repo.dart';
import 'package:tech_nava/utils/dio_error_extension.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeInitial());

  final HomeRepo _homeRepo = Modular.get<HomeRepo>();

  Future<void> fetchAlbums() async {
    try {
      emit(HomeLoading());
      final albums = await _homeRepo.fetchAlbumsData();

      if (albums.isNotEmpty) {
        emit(HomeLoaded(albums: albums));
      } else {
        emit(HomeEmpty());
      }
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  void _handleError(DioException error) {
    emit(HomeError(
      errorMessage: error.errorMessage(),
      albums: state.albums,
    ));
  }
}
