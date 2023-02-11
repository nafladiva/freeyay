import 'package:freeyay/domain/entities/entities.dart';

class GameMdl {
  final int id;
  final String? title;
  final String? thumbnail;
  final String? shortDescription;
  final String? gameUrl;
  final String? genre;
  final String? platform;
  final String? publisher;
  final String? developer;
  final DateTime? releaseDate;

  const GameMdl({
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
