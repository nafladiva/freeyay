import 'package:dartz/dartz.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/domain/repositories/repository.dart';

class GetLiveGames {
  final Repository repository;

  GetLiveGames(this.repository);

  Future<Either<Failure, List<Game>>> execute() {
    return repository.getLiveGame();
  }
}
