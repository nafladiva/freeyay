import 'package:dartz/dartz.dart';
import 'package:freeyay/common/failure.dart';
import 'package:freeyay/domain/entities/game.dart';

abstract class Repository {
  Future<Either<Failure, List<Game>>> getLiveGame();
  Future<Either<Failure, List<Game>>> getGamesByPlatform(String platform);
}
