import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/domain/usecases/usecases.dart';

part 'detail_game_event.dart';
part 'detail_game_state.dart';

class DetailGameBloc extends Bloc<DetailGameEvent, DetailGameState> {
  final GetDetailGame getDetailGame;
  final CheckFavoriteStatus checkFavoriteStatus;

  DetailGameBloc(this.getDetailGame, this.checkFavoriteStatus)
      : super(DetailGameLoading()) {
    Future<bool> checkGameFavoriteStatus(Game game) async {
      final res = await checkFavoriteStatus.execute(game);
      return res;
    }

    on<OnLoadDetailGame>((event, emit) async {
      final gameId = event.gameId;

      emit(DetailGameLoading());

      final res = await getDetailGame.execute(gameId);
      await res.fold(
        (failure) {
          emit(DetailGameFailed(failure.message));
        },
        (data) async {
          final isFavorite = await checkGameFavoriteStatus(data);
          emit(DetailGameSuccess(data, isFavorite: isFavorite));
        },
      );
    });

    on<OnCheckFavoriteStatus>((event, emit) async {
      final game = event.game;
      emit(DetailGameLoading());

      final isFavorite = await checkGameFavoriteStatus(game);
      emit(FavoriteStatusSuccess(isFavorite: isFavorite));
    });
  }
}
