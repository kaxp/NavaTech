// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlbumsResponseAdapter extends TypeAdapter<AlbumsResponse> {
  @override
  final int typeId = 0;

  @override
  AlbumsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlbumsResponse(
      userId: fields[0] as int,
      id: fields[1] as int,
      title: fields[2] as String,
      images: (fields[3] as List).cast<ImageData>(),
    );
  }

  @override
  void write(BinaryWriter writer, AlbumsResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlbumsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageDataAdapter extends TypeAdapter<ImageData> {
  @override
  final int typeId = 1;

  @override
  ImageData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageData(
      albumId: fields[0] as int,
      id: fields[1] as int,
      title: fields[2] as String,
      url: fields[3] as String,
      thumbnailUrl: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.albumId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.thumbnailUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
