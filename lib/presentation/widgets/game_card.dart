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
    return Container(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Text(game.title),
          Text(game.description),
          Text(game.genre),
        ],
      ),
    );
  }
}
