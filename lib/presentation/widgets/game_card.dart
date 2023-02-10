import 'package:flutter/material.dart';
import 'package:freeyay/domain/entities/game.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(game.thumbnail),
        const SizedBox(height: 5.0),
        Text(game.title),
        // Text(game.description),
        Text(game.genre),
      ],
    );
  }
}
