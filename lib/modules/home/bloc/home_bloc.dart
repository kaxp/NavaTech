import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:tech_nava/modules/home/models/albums_response.dart';
import 'package:tech_nava/modules/home/repositories/home_repo.dart';
import 'package:tech_nava/utils/dio_error_extension.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeInitial());

  final HomeRepo _homeRepo = Modular.get<HomeRepo>();

  /// Fetch albums and their corresponding images
  Future<void> fetchAlbums() async {
    try {
      emit(HomeLoading());

      // Fetch all albums
      final albums = await _homeRepo.fetchAlbumsData();
      if (albums.isEmpty) {
        emit(HomeEmpty());
        return;
      }

      // Fetch images for all albums concurrently
      final albumsWithImages = await _fetchAlbumsWithImages(albums);

      emit(HomeLoaded(albums: albumsWithImages));
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  /// Fetch images for all albums concurrently and merge them
  Future<List<AlbumsResponse>> _fetchAlbumsWithImages(
    List<AlbumsResponse> albums,
  ) async {
    final albumsWithImages = await Future.wait(
      albums.map((album) async {
        final images = await fetchAlbumImages(album.id);
        return album.copyWith(images: images);
      }),
    );

    return albumsWithImages;
  }

  /// Fetch images for a specific album
  Future<List<ImageData>> fetchAlbumImages(int albumId) async {
    try {
      return await _homeRepo.fetchAlbumImages(albumId: albumId);
    } on DioException catch (error) {
      debugPrint(error.toString());
      return []; // Return an empty list if fetching images fails
    }
  }

  void _handleError(DioException error) {
    emit(HomeError(
      errorMessage: error.errorMessage(),
      albums: state.albums,
    ));
  }
}
