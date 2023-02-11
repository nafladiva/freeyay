import 'package:dartz/dartz.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/domain/repositories/repository.dart';

class GetGamesByPlatform {
  final Repository repository;

  GetGamesByPlatform(this.repository);

  Future<Either<Failure, List<Game>>> execute(Platform platform) {
    return repository.getGamesByPlatform(platform);
  }
}
