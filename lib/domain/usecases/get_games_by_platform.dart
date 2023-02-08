import 'package:dartz/dartz.dart';
import 'package:freeyay/common/failure.dart';
import 'package:freeyay/domain/entities/game.dart';
import 'package:freeyay/domain/repositories/repository.dart';

import '../../common/enums.dart';

class GetGamesByPlatform {
  final Repository repository;

  GetGamesByPlatform(this.repository);

  Future<Either<Failure, List<Game>>> execute(Platform platform) {
    return repository.getGamesByPlatform(platform);
  }
}
