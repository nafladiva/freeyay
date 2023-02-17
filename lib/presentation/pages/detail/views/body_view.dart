import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:freeyay/presentation/widgets/widgets.dart';

class BodyView extends StatelessWidget {
  BodyView({
    required this.game,
    required this.isFavorite,
    required this.onTapFavoriteCallback,
    super.key,
  });

  final Game game;
  final bool isFavorite;
  final VoidCallback onTapFavoriteCallback;

  final descKey = GlobalKey();
  final ssKey = GlobalKey();

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
                FavoriteButton(game: game),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: game.thumbnail,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 10.0),
              child: TabBar(
                indicatorColor: Themes.orangeColor,
                tabs: const [
                  Tab(text: 'Description'),
                  Tab(text: 'Screenshots'),
                ],
                onTap: (value) {
                  if (value == 0) {
                    Scrollable.ensureVisible(
                      descKey.currentContext ?? context,
                      duration: const Duration(seconds: 1),
                    );
                  }
                  if (value == 1) {
                    Scrollable.ensureVisible(
                      ssKey.currentContext ?? context,
                      duration: const Duration(seconds: 1),
                    );
                    DefaultTabController.of(context)?.animateTo(1);
                  }
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          key: descKey,
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
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          key: ssKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Screenshots',
                  style: TStyles.subheading1(),
                ),
                const SizedBox(height: 10.0),
                ...(game.screenshots ?? []).map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: item,
                      ),
                    ),
                  ),
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
