import 'package:tech_nava/modules/home/models/albums_response.dart';
import 'package:tech_nava/networking/retrofit/home_api_client.dart';

class HomeRepo {
  final HomeApiClient _homeApiClient = HomeApiClient.withDefaultDio();

  Future<List<AlbumsResponse>> fetchAlbumsData() async {
    return _homeApiClient.getAlbumsData();
  }
}
