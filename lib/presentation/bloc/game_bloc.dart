import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeyay/domain/entities/game.dart';
import 'package:freeyay/domain/usecases/get_live_games.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GetLiveGames getLiveGames;

  GameBloc(this.getLiveGames) : super(GameInitial()) {
    on<OnFetchLiveGames>((event, emit) async {
      emit(GameLoading());

      final res = await getLiveGames.execute();
      res.fold(
        (failure) {
          emit(const GameError('[Error]'));
        },
        (data) {
          emit(GameSuccess(data));
        },
      );
    });

    on<OnFetchGamesByPlatform>((event, emit) {
      final platform = event.platform;
      //TODO: implement handling fetch games by platform
      print(platform);
    });
  }
}
