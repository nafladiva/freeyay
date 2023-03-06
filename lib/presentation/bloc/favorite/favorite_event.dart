part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class OnLoadFavorite extends FavoriteEvent {
  final String? message;

  const OnLoadFavorite({this.message});

  @override
  List<Object?> get props => [];
}

class OnAddFavorite extends FavoriteEvent {
  final Game game;

  const OnAddFavorite(this.game);

  @override
  List<Object?> get props => [game];
}

class OnRemoveFavorite extends FavoriteEvent {
  final Game game;

  const OnRemoveFavorite(this.game);

  @override
  List<Object?> get props => [game];
}
