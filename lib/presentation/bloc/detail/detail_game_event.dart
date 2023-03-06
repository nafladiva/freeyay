part of 'detail_game_bloc.dart';

abstract class DetailGameEvent extends Equatable {
  const DetailGameEvent();
}

class OnLoadDetailGame extends DetailGameEvent {
  final int gameId;

  const OnLoadDetailGame(this.gameId);

  @override
  List<Object?> get props => [gameId];
}

class OnCheckFavoriteStatus extends DetailGameEvent {
  final Game game;

  const OnCheckFavoriteStatus(this.game);

  @override
  List<Object?> get props => [game];
}
