import 'package:freeyay/common/common.dart';
import 'package:freeyay/data/sources/db/hive_local_database.dart';
import 'package:freeyay/domain/entities/entities.dart';

abstract class LocalDataSource {
  Future<List<Game>> getAllFavoriteGames();
  Future<bool> checkFavoriteStatus(Game game);
  Future<void> addFavorite(Game game);
  Future<void> removeFavorite(Game game);
}

class LocalDataSourceImpl implements LocalDataSource {
  final HiveLocalDatabase hiveDatabase;

  LocalDataSourceImpl({required this.hiveDatabase});

  @override
  Future<List<Game>> getAllFavoriteGames() async {
    try {
      final box = hiveDatabase.getFavorites();

      //Sort by added timestamp
      final sorted = box.values.toList()
        ..sort(((a, b) => b.addedToFavoriteTimeStamp!
            .compareTo(a.addedToFavoriteTimeStamp!)));

      return sorted.map((game) => game.toEntity()).toList();
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> addFavorite(Game game) async {
    try {
      hiveDatabase.addFavorite(game);
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<void> removeFavorite(Game game) async {
    try {
      hiveDatabase.removeFavorite(game);
    } catch (e) {
      throw DatabaseException();
    }
  }

  @override
  Future<bool> checkFavoriteStatus(Game game) async {
    try {
      return hiveDatabase.checkFavoriteStatus(game);
    } catch (e) {
      throw DatabaseException();
    }
  }
}
