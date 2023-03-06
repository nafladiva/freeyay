part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  final Platform? platform;

  const GameState({
    this.platform = Platform.all,
  });
}

class GameInitial extends GameState {
  @override
  List<Object?> get props => [];
}

class GameLoading extends GameState {
  const GameLoading({Platform? platform}) : super(platform: platform);

  @override
  List<Object?> get props => [];
}

class GameSuccess extends GameState {
  final List<Game> gameList;

  const GameSuccess(this.gameList, {Platform? platform})
      : super(platform: platform);

  @override
  List<Object?> get props => [gameList];
}

class GameError extends GameState {
  final String message;

  const GameError(this.message, {Platform? platform})
      : super(platform: platform);

  @override
  List<Object?> get props => [message];
}
