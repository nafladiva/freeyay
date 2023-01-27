import 'package:equatable/equatable.dart';

class GameMdl extends Equatable {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final DateTime? releaseDate;

  const GameMdl({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
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
        releaseDate: json["release_date"] != null
            ? DateTime.parse(json["release_date"])
            : null,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        thumbnail,
        shortDescription,
        gameUrl,
        genre,
        platform,
        publisher,
        developer,
        releaseDate,
      ];
}
