import 'package:equatable/equatable.dart';

class Game extends Equatable {
  final int id;
  final String title;
  final String thumbnail;
  final String? description;
  final String genre;
  final List<String>? screenshots;

  const Game({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.description,
    required this.genre,
    this.screenshots,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        thumbnail,
        description,
        genre,
        screenshots,
      ];
}
