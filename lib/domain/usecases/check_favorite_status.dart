import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/domain/repositories/repository.dart';

class CheckFavoriteStatus {
  final Repository repository;

  CheckFavoriteStatus(this.repository);

  Future<bool> execute(Game game) {
    return repository.checkFavoriteStatus(game);
  }
}
