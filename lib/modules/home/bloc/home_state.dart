part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState({
    this.albums = const [],
  });

  final List<AlbumsResponse> albums;

  @override
  List<Object?> get props => [albums];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeEmpty extends HomeState {}

class HomeLoaded extends HomeState {
  const HomeLoaded({
    required List<AlbumsResponse> albums,
  }) : super(albums: albums);
}

class HomeError extends HomeState {
  const HomeError({
    required this.errorMessage,
    required List<AlbumsResponse> albums,
  }) : super(albums: albums);

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
