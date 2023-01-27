import 'dart:convert';

import 'package:freeyay/common/exceptions.dart';
import 'package:http/http.dart' as http;

import 'package:freeyay/data/models/game_mdl.dart';

import '../../common/consts.dart';

abstract class RemoteDataSource {
  Future<List<GameMdl>> getLiveGames();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<GameMdl>> getLiveGames() async {
    try {
      final res = await http.get(
        Uri.parse(
          baseUrl,
        ),
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
}
