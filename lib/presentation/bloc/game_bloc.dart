import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeyay/domain/entities/game.dart';
import 'package:freeyay/domain/usecases/get_games_by_platform.dart';
import 'package:freeyay/domain/usecases/get_live_games.dart';

import '../../common/enums.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GetLiveGames getLiveGames;
  final GetGamesByPlatform getGamesByPlatform;

  GameBloc(this.getLiveGames, this.getGamesByPlatform) : super(GameInitial()) {
    on<OnFetchLiveGames>((event, emit) async {
      emit(const GameLoading());

      final res = await getLiveGames.execute();
      res.fold(
        (failure) {
          emit(const GameError('Failed to fetch data'));
        },
        (data) {
          emit(GameSuccess(data));
        },
      );
    });

    on<OnFetchGamesByPlatform>((event, emit) async {
      final platform = event.platform;

      emit(GameLoading(platform: platform));

      final res = await getGamesByPlatform.execute(platform);
      res.fold(
        (failure) {
          emit(GameError('Failed to fetch data', platform: platform));
        },
        (data) {
          emit(GameSuccess(data, platform: platform));
        },
      );
    });
  }
}
