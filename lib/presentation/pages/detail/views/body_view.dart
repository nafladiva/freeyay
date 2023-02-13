import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/presentation/widgets/widgets.dart';

class BodyView extends StatelessWidget {
  const BodyView({
    required this.game,
    required this.isFavorite,
    required this.onTapFavoriteCallback,
    super.key,
  });

  final Game game;
  final bool isFavorite;
  final VoidCallback onTapFavoriteCallback;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl: game.thumbnail,
              ),
              FavoriteButton(
                game: game,
                isFavorite: isFavorite,
                callback: onTapFavoriteCallback,
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Text(
                  game.title,
                  style: TStyles.heading1(),
                ),
                const SizedBox(height: 5.0),
                MyChip(text: game.genre),
                const SizedBox(height: 20.0),
                Text(
                  'Description',
                  style: TStyles.subheading1(),
                ),
                const SizedBox(height: 5.0),
                Text(
                  game.description ?? '',
                  textAlign: TextAlign.justify,
                  style: TStyles.paragraph1(),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Screenshots',
                  style: TStyles.subheading1(),
                ),
                const SizedBox(height: 5.0),
                ScrollableHorizontalView(
                  children: [
                    ...(game.screenshots ?? []).map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: CachedNetworkImage(
                          width: 150,
                          imageUrl: item,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
