import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeyay/common/enums.dart';
import 'package:freeyay/common/text_styles.dart';
import 'package:freeyay/injection.dart';
import 'package:freeyay/presentation/bloc/bloc.dart';
import 'package:freeyay/presentation/widgets/widgets.dart';

class GamesByPlatformView extends StatefulWidget {
  const GamesByPlatformView({
    Key? key,
  }) : super(key: key);

  @override
  State<GamesByPlatformView> createState() => _GamesByPlatformViewState();
}

class _GamesByPlatformViewState extends State<GamesByPlatformView> {
  late GameBloc gameBloc;

  @override
  void initState() {
    super.initState();
    gameBloc = locator<GameBloc>();
    gameBloc.add(const OnFetchGamesByPlatform(Platform.all));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: gameBloc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Games by Platform',
            style: TStyles.heading1(),
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              ChipButton(
                text: 'All',
                onTap: () =>
                    gameBloc.add(const OnFetchGamesByPlatform(Platform.all)),
              ),
              ChipButton(
                text: 'PC',
                onTap: () =>
                    gameBloc.add(const OnFetchGamesByPlatform(Platform.pc)),
              ),
              ChipButton(
                text: 'Browser',
                onTap: () => gameBloc
                    .add(const OnFetchGamesByPlatform(Platform.browser)),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              if (state is GameSuccess) {
                final games = state.gameList;

                return ScrollableHorizontalView(
                  children: [
                    ...games.map(
                      (game) => GameCard(game: game),
                    ),
                  ],
                );
              }

              if (state is GameLoading) {
                return const GameCardLoader();
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
