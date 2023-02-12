part of 'detail_game_bloc.dart';

abstract class DetailGameEvent extends Equatable {
  const DetailGameEvent();

  @override
  List<Object> get props => [];
}

class OnLoadDetailGame extends DetailGameEvent {
  final int gameId;

  const OnLoadDetailGame(this.gameId);
}
