part of 'detail_game_bloc.dart';

abstract class DetailGameState extends Equatable {
  const DetailGameState();
}

class DetailGameLoading extends DetailGameState {
  @override
  List<Object?> get props => [];
}

class DetailGameSuccess extends DetailGameState {
  final Game game;
  final bool isFavorite;

  const DetailGameSuccess(this.game, {this.isFavorite = false});

  @override
  List<Object?> get props => [game, isFavorite];
}

class FavoriteStatusSuccess extends DetailGameState {
  final bool isFavorite;

  const FavoriteStatusSuccess(this.isFavorite);

  @override
  List<Object?> get props => [isFavorite];
}

class DetailGameFailed extends DetailGameState {
  final String message;

  const DetailGameFailed(this.message);

  @override
  List<Object?> get props => [message];
}
