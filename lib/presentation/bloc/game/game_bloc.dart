import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/domain/usecases/usecases.dart';

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
          emit(GameError(failure.message));
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
          emit(GameError(failure.message, platform: platform));
        },
        (data) {
          emit(GameSuccess(data, platform: platform));
        },
      );
    });
  }
}
