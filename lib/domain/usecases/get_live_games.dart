import 'package:dartz/dartz.dart';
import 'package:freeyay/common/failure.dart';
import 'package:freeyay/domain/entities/game.dart';
import 'package:freeyay/domain/repositories/repository.dart';

class GetLiveGames {
  final Repository repository;

  GetLiveGames(this.repository);

  Future<Either<Failure, List<Game>>> execute() {
    return repository.getLiveGame();
  }
}
