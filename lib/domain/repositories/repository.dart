import 'package:dartz/dartz.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/domain/entities/entities.dart';

abstract class Repository {
  //Remote
  Future<Either<Failure, List<Game>>> getLiveGame();
  Future<Either<Failure, List<Game>>> getGamesByPlatform(Platform platform);

  //Local
  Future<Either<Failure, List<Game>>> getFavoriteGames();
  Future<Either<Failure, String>> addFavorite(Game game);
  Future<Either<Failure, void>> removeFavorite(Game game);
}
