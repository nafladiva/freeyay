import 'package:dartz/dartz.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/domain/repositories/repository.dart';

class AddFavorite {
  final Repository repository;

  AddFavorite(this.repository);

  Future<Either<Failure, String>> execute(Game game) {
    return repository.addFavorite(game);
  }
}
