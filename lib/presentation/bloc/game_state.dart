part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  final Platform? platform;
  final List<Game> gameList;
  final String? errorMessage;

  const GameState({
    this.platform = Platform.all,
    this.gameList = const [],
    this.errorMessage,
  });

  @override
  List<Object> get props => [platform!, gameList, errorMessage!];
}

class GameInitial extends GameState {}

class GameLoading extends GameState {
  const GameLoading({Platform? platform}) : super(platform: platform);
}

class GameSuccess extends GameState {
  const GameSuccess(List<Game> gameList, {Platform? platform})
      : super(gameList: gameList, platform: platform);
}

class GameError extends GameState {
  const GameError(String message, {Platform? platform})
      : super(errorMessage: message, platform: platform);
}
