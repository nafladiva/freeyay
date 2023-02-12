import 'package:dartz/dartz.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/domain/repositories/repository.dart';

class GetDetailGame {
  final Repository repository;

  GetDetailGame(this.repository);

  Future<Either<Failure, Game>> execute(int gameId) {
    return repository.getDetailGame(gameId);
  }
}
