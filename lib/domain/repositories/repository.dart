import 'package:dartz/dartz.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/domain/entities/entities.dart';

abstract class Repository {
  Future<Either<Failure, List<Game>>> getLiveGame();
  Future<Either<Failure, List<Game>>> getGamesByPlatform(Platform platform);
}
