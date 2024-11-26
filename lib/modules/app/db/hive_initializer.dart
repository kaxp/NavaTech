import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tech_nava/modules/home/models/albums_response.dart';

class HiveInitializer {
  static Future<void> initHive() async {
    // Get the application document directory
    final appDocumentDirectory = await getApplicationDocumentsDirectory();

    Hive.init(appDocumentDirectory.path);

    // Register all the custom hive adapters here
    Hive.registerAdapter(AlbumsResponseAdapter());
    Hive.registerAdapter(ImageDataAdapter());

    await Hive.initFlutter();
  }
}
