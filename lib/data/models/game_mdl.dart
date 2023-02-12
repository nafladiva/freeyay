import 'package:freeyay/domain/entities/entities.dart';
import 'package:hive/hive.dart';

part 'game_mdl.g.dart';

@HiveType(typeId: 0)
class GameMdl extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? thumbnail;
  @HiveField(3)
  final String? shortDescription;
  final String? gameUrl;
  @HiveField(4)
  final String? genre;
  final String? platform;
  final String? publisher;
  final String? developer;
  final DateTime? releaseDate;

  GameMdl({
    required this.id,
    this.title,
    this.thumbnail,
    this.shortDescription,
    this.gameUrl,
    this.genre,
    this.platform,
    this.publisher,
    this.developer,
    this.releaseDate,
  });

  factory GameMdl.fromMap(Map<String, dynamic> json) => GameMdl(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        shortDescription: json["short_description"],
        gameUrl: json["game_url"],
        genre: json["genre"],
        platform: json["platform"],
        publisher: json["publisher"],
        developer: json["developer"],
        releaseDate: DateTime.tryParse(json["release_date"]),
      );

  Game toEntity() {
    return Game(
      id: id,
      title: title ?? '',
      thumbnail: thumbnail ?? '',
      description: shortDescription ?? '',
      genre: genre ?? '',
    );
  }
}
