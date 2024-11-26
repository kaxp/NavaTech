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
  });

  final int userId;
  final int id;
  final String title;

  factory AlbumsResponse.fromJson(Map<String, dynamic> json) =>
      _$AlbumsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumsResponseToJson(this);

  @override
  List<Object?> get props => [userId, id, title];
}
