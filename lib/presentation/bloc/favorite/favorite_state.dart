part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteInitial extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class FavoriteLoading extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class FavoriteSuccess extends FavoriteState {
  final List<Game> favoriteGames;
  final String? message;

  const FavoriteSuccess({required this.favoriteGames, this.message});

  @override
  List<Object?> get props => [favoriteGames];
}

class FavoriteFailed extends FavoriteState {
  final String message;

  const FavoriteFailed(this.message);

  @override
  List<Object?> get props => [message];
}
