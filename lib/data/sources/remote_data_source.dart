import 'dart:convert';

import 'package:freeyay/common/common.dart';
import 'package:http/http.dart' as http;

import 'package:freeyay/data/models/models.dart';

abstract class RemoteDataSource {
  Future<List<GameMdl>> getLiveGames();
  Future<List<GameMdl>> getGamesByPlatform(Platform platform);
  Future<GameMdl> getDetailGame(int gameId);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<GameMdl>> getLiveGames() async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/games'),
      );

      if (res.statusCode == 200) {
        final decoded = json.decode(res.body);
        return List<GameMdl>.from(decoded.map((x) => GameMdl.fromMap(x)));
      } else if (res.statusCode == 404) {
        throw DataException();
      } else if (res.statusCode == 500) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<GameMdl>> getGamesByPlatform(Platform platform) async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/games?platform=${platform.name}'),
      );

      if (res.statusCode == 200) {
        final decoded = json.decode(res.body);
        return List<GameMdl>.from(decoded.map((x) => GameMdl.fromMap(x)));
      } else if (res.statusCode == 404) {
        throw DataException();
      } else if (res.statusCode == 500) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<GameMdl> getDetailGame(int gameId) async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/game?id=$gameId'),
      );

      if (res.statusCode == 200) {
        final decoded = json.decode(res.body);
        return GameMdl.fromMap(decoded);
      } else if (res.statusCode == 404) {
        throw DataException();
      } else if (res.statusCode == 500) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
