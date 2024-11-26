// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumsResponse _$AlbumsResponseFromJson(Map<String, dynamic> json) =>
    AlbumsResponse(
      userId: (json['userId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AlbumsResponseToJson(AlbumsResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'images': instance.images,
    };

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      albumId: (json['albumId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
