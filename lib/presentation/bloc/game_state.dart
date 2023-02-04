part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameInitial extends GameState {}

class GameLoading extends GameState {}

class GameSuccess extends GameState {
  final List<Game> gameList;

  const GameSuccess(this.gameList);
}

class GameError extends GameState {
  final String message;

  const GameError(this.message);
}
