import 'package:tech_nava/modules/home/models/events_response.dart';
import 'package:tech_nava/networking/retrofit/home_api_client.dart';

class HomeRepo {
  final HomeApiClient _homeApiClient = HomeApiClient.withDefaultDio();

  Future<List<AlbumsData>> fetchAlbumsData() async {
    return _homeApiClient.getAlbumsData();
  }
}
