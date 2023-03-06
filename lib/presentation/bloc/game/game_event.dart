part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class OnFetchLiveGames extends GameEvent {
  @override
  List<Object?> get props => [];
}

class OnFetchGamesByPlatform extends GameEvent {
  final Platform platform;

  const OnFetchGamesByPlatform(this.platform);

  @override
  List<Object> get props => [platform];
}
