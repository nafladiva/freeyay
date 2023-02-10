import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freeyay/common/text_styles.dart';
import 'package:freeyay/domain/entities/game.dart';
import 'package:freeyay/presentation/widgets/widgets.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      margin: const EdgeInsets.only(right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              width: 200,
              imageUrl: game.thumbnail,
              // placeholder: (_, __) => const CircularProgressIndicator(),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            game.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TStyles.subheading2(),
          ),
          const SizedBox(height: 4.0),
          MyChip(text: game.genre),
        ],
      ),
    );
  }
}
