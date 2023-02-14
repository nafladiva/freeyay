import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/domain/usecases/usecases.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavoriteGames getFavoriteGames;
  final AddFavorite addFavorite;
  final RemoveFavorite removeFavorite;

  FavoriteBloc(this.getFavoriteGames, this.addFavorite, this.removeFavorite)
      : super(FavoriteInitial()) {
    on<OnAddFavorite>((event, emit) async {
      final game = event.game;

      emit(FavoriteLoading());

      final res = await addFavorite.execute(game);
      res.fold(
        (failure) {
          emit(const FavoriteFailed('Failed to add favorite games'));
        },
        (data) {
          emit(const FavoriteSuccess(message: 'Success to add favorite game'));
          add(OnLoadFavorite());
        },
      );
    });

    on<OnRemoveFavorite>((event, emit) async {
      final game = event.game;

      emit(FavoriteLoading());

      final res = await removeFavorite.execute(game);
      res.fold(
        (failure) {
          emit(const FavoriteFailed('Failed to remove favorite games'));
        },
        (data) {
          emit(const FavoriteSuccess(
              message: 'Success to remove favorite game'));
          add(OnLoadFavorite());
        },
      );
    });

    on<OnLoadFavorite>((event, emit) async {
      emit(FavoriteLoading());

      final res = await getFavoriteGames.execute();
      res.fold(
        (failure) {
          emit(const FavoriteFailed('Failed to get favorite games'));
        },
        (data) {
          emit(FavoriteSuccess(favoriteGames: data));
        },
      );
    });
  }
}
