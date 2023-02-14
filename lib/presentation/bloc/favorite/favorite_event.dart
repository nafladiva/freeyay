part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class OnLoadFavorite extends FavoriteEvent {}

class OnAddFavorite extends FavoriteEvent {
  final Game game;

  const OnAddFavorite(this.game);
}

class OnRemoveFavorite extends FavoriteEvent {
  final Game game;

  const OnRemoveFavorite(this.game);
}
