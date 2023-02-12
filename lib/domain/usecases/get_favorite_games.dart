import 'package:dartz/dartz.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/domain/repositories/repository.dart';

class GetFavoriteGames {
  final Repository repository;

  GetFavoriteGames(this.repository);

  Future<Either<Failure, List<Game>>> execute() {
    return repository.getFavoriteGames();
  }
}
