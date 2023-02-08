import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String title;
  final String desc;
  final String genre;

  const GameCard({
    super.key,
    required this.title,
    required this.desc,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Text(title),
          Text(desc),
          Text(genre),
        ],
      ),
    );
  }
}
