import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tech_nava/modules/home/models/albums_response.dart';
import 'package:tech_nava/networking/constants/network_constants.dart';
import 'package:tech_nava/networking/models/app_dio.dart';

part 'home_api_client.g.dart';

@RestApi()
abstract class HomeApiClient {
  factory HomeApiClient.withDefaultDio({String? baseUrl}) {
    return HomeApiClient(
      Modular.get<AppDio>().noAuthDio,
      baseUrl: NetworkConstants.baseUrl,
    );
  }

  factory HomeApiClient(Dio dio, {String? baseUrl}) {
    return _HomeApiClient(
      dio,
      baseUrl: NetworkConstants.baseUrl,
    );
  }

  @GET('/albums')
  Future<List<AlbumsResponse>> getAlbumsData();

  @GET('/photos')
  Future<List<ImageData>> getAlbumImages({
    @Query('albumId') required int albumId,
  });
}
