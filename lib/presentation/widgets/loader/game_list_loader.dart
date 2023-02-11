import 'package:flutter/material.dart';
import 'package:freeyay/presentation/widgets/widgets.dart';

class GameListLoader extends StatelessWidget {
  const GameListLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          GameCardLoader(),
          GameCardLoader(),
          GameCardLoader(),
        ],
      ),
    );
  }
}
