import 'package:hive/hive.dart';
import 'package:tech_nava/modules/home/models/albums_response.dart';
import 'package:tech_nava/networking/retrofit/home_api_client.dart';

class HomeRepo {
  final HomeApiClient _homeApiClient = HomeApiClient.withDefaultDio();

  static const _albumsHiveBoxName = 'albumsBox';
  static const _imagesHiveBoxName = 'imagesBox';

  /// Fetch albums data either from Hive cache when available or from API
  Future<List<AlbumsResponse>> fetchAlbumsData() async {
    final box = await Hive.openBox<AlbumsResponse>(_albumsHiveBoxName);

    if (box.isNotEmpty) {
      return box.values.toList();
    }

    // If no data in Hive, fetch from API
    final albums = await _homeApiClient.getAlbumsData();

    // Save the fetched data into Hive
    for (var album in albums) {
      box.put(album.id, album); // Store album by ID
    }

    return albums;
  }

  /// Fetch images for a specific album, either from Hive cache when available or from API
  Future<List<ImageData>> fetchAlbumImages({required int albumId}) async {
    final imagesBox = await Hive.openBox<List<dynamic>>(_imagesHiveBoxName);

    if (imagesBox.containsKey(albumId)) {
      return List<ImageData>.from(imagesBox.get(albumId) as List<dynamic>);
    }

    // If no images in Hive, fetch from API
    final images = await _homeApiClient.getAlbumImages(albumId: albumId);

    // Store the fetched images in Hive
    imagesBox.put(albumId, images);

    return images;
  }
}
