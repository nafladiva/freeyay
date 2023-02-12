import 'package:freeyay/common/common.dart';
import 'package:freeyay/data/models/models.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:hive/hive.dart';

class HiveLocalDatabase {
  Box<GameMdl> getFavorites() {
    return Hive.box<GameMdl>(favoriteBox);
  }

  void addFavorite(Game game) {
    Hive.box<GameMdl>(favoriteBox).put(game.id, _convertToGameMdl(game));
  }

  void removeFavorite(Game game) {
    Hive.box<GameMdl>(favoriteBox).delete(game.id);
  }

  //Convert game entity to hive model
  GameMdl _convertToGameMdl(Game game) {
    return GameMdl(
      id: game.id,
      title: game.title,
      thumbnail: game.thumbnail,
      description: game.description,
      genre: game.genre,
    );
  }
}
