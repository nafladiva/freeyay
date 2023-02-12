import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/domain/usecases/get_detail_game.dart';

part 'detail_game_event.dart';
part 'detail_game_state.dart';

class DetailGameBloc extends Bloc<DetailGameEvent, DetailGameState> {
  final GetDetailGame getDetailGame;

  DetailGameBloc(this.getDetailGame) : super(DetailGameLoading()) {
    on<OnLoadDetailGame>((event, emit) async {
      final gameId = event.gameId;

      emit(DetailGameLoading());

      final res = await getDetailGame.execute(gameId);
      res.fold(
        (failure) {
          emit(const DetailGameFailed('Gagal memuat detail game'));
        },
        (data) {
          emit(DetailGameSuccess(data));
        },
      );
    });
  }
}
