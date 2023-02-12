part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  final List<Game>? favoriteGames;
  final String? message;

  const FavoriteState({
    this.favoriteGames = const [],
    this.message,
  });

  @override
  List<Object> get props => [favoriteGames!, message!];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  const FavoriteSuccess({List<Game>? favoriteGames, String? message})
      : super(favoriteGames: favoriteGames, message: message);
}

class FavoriteFailed extends FavoriteState {
  const FavoriteFailed(String message) : super(message: message);
}
