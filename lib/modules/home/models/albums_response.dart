import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'albums_response.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class AlbumsResponse extends HiveObject {
  AlbumsResponse({
    required this.userId,
    required this.id,
    required this.title,
    this.images = const [], // Default empty list for images
  });

  @HiveField(0)
  final int userId;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final List<ImageData> images;

  factory AlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$AlbumsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumsResponseToJson(this);

  AlbumsResponse copyWith({List<ImageData>? images}) {
    return AlbumsResponse(
      userId: userId,
      id: id,
      title: title,
      images: images ?? this.images,
    );
  }

  List<Object?> get props => [userId, id, title, images];
}

@HiveType(typeId: 1)
@JsonSerializable()
class ImageData extends HiveObject {
  ImageData({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @HiveField(0)
  final int albumId;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String url;

  @HiveField(4)
  final String thumbnailUrl;

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDataToJson(this);

  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];
}
