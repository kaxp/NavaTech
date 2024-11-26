// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'albums_response.g.dart';

@JsonSerializable()
class AlbumsResponse extends Equatable {
  const AlbumsResponse({
    required this.userId,
    required this.id,
    required this.title,
    this.images = const [], // Default empty list for images
  });

  final int userId;
  final int id;
  final String title;
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

  @override
  List<Object?> get props => [userId, id, title];
}

@JsonSerializable()
class ImageData extends Equatable {
  const ImageData({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDataToJson(this);

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];
}
