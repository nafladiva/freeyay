import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/presentation/bloc/bloc.dart';
import 'package:freeyay/presentation/widgets/widgets.dart';

class YourFavoriteView extends StatefulWidget {
  final FavoriteBloc bloc;

  const YourFavoriteView({super.key, required this.bloc});

  @override
  State<YourFavoriteView> createState() => _YourFavoriteViewState();
}

class _YourFavoriteViewState extends State<YourFavoriteView> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(const OnLoadFavorite());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Favorites',
          style: TStyles.heading1(),
        ),
        const SizedBox(height: 15.0),
        BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteSuccess) {
              final favoriteGames = state.favoriteGames;

              return ScrollableHorizontalView(
                children: List.generate(
                  favoriteGames.length,
                  (index) => GameCard(game: favoriteGames[index]),
                ),
              );
            }

            if (state is FavoriteFailed) {
              return Text(state.message);
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }
}
