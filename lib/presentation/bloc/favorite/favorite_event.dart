part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class OnAddFavorite extends FavoriteEvent {
  final Game game;

  const OnAddFavorite(this.game);
}
