part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class OnFetchLiveGames extends GameEvent {}

class OnFetchGamesByPlatform extends GameEvent {
  final Platform platform;

  const OnFetchGamesByPlatform(this.platform);
}
