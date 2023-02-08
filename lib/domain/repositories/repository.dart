import 'package:dartz/dartz.dart';
import 'package:freeyay/common/failure.dart';
import 'package:freeyay/domain/entities/game.dart';

import '../../common/enums.dart';

abstract class Repository {
  Future<Either<Failure, List<Game>>> getLiveGame();
  Future<Either<Failure, List<Game>>> getGamesByPlatform(Platform platform);
}
