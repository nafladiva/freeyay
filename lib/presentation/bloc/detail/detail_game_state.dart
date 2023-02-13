part of 'detail_game_bloc.dart';

abstract class DetailGameState extends Equatable {
  final bool isFavorite;
  final String? message;

  const DetailGameState({this.isFavorite = false, this.message});

  @override
  List<Object> get props => [];
}

class DetailGameLoading extends DetailGameState {}

class DetailGameSuccess extends DetailGameState {
  final Game game;

  const DetailGameSuccess(this.game, {bool? isFavorite})
      : super(isFavorite: isFavorite ?? false);
}

class DetailGameFailed extends DetailGameState {
  const DetailGameFailed(String message) : super(message: message);
}
