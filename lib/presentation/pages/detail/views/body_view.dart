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
    return CustomScrollView(
      slivers: [
        DefaultTabController(
          length: 2,
          child: SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            collapsedHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  game.title,
                  style: TStyles.heading1(color: Colors.white),
                ),
                FavoriteButton(
                  game: game,
                  isFavorite: isFavorite,
                  callback: () {},
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: game.thumbnail,
              ),
            ),
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 10.0),
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Description',
                  ),
                  Tab(
                    text: 'Screenshots',
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Genre',
                  style: TStyles.subheading1(),
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
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
