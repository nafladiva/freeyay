import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeyay/common/enums.dart';
import 'package:freeyay/common/text_styles.dart';
import 'package:freeyay/presentation/bloc/bloc.dart';
import 'package:freeyay/presentation/widgets/widgets.dart';

class GamesByPlatformView extends StatefulWidget {
  final GameBloc bloc;

  const GamesByPlatformView({Key? key, required this.bloc}) : super(key: key);

  @override
  State<GamesByPlatformView> createState() => _GamesByPlatformViewState();
}

class _GamesByPlatformViewState extends State<GamesByPlatformView> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(const OnFetchGamesByPlatform(Platform.all));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.bloc,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Games by Platform',
            style: TStyles.heading1(),
          ),
          const SizedBox(height: 15.0),
          BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              Platform? selectedPlatform = state.platform;

              return Row(
                children: [
                  ChipButton(
                    text: 'All',
                    isSelected: selectedPlatform == Platform.all,
                    onTap: () => widget.bloc
                        .add(const OnFetchGamesByPlatform(Platform.all)),
                  ),
                  ChipButton(
                    text: 'PC',
                    isSelected: selectedPlatform == Platform.pc,
                    onTap: () => widget.bloc
                        .add(const OnFetchGamesByPlatform(Platform.pc)),
                  ),
                  ChipButton(
                    text: 'Browser',
                    isSelected: selectedPlatform == Platform.browser,
                    onTap: () => widget.bloc
                        .add(const OnFetchGamesByPlatform(Platform.browser)),
                  ),
                ],
              );
            },
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

              if (state is GameLoading) return const GameListLoader();
              if (state is GameError) return Text(state.errorMessage ?? '');

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
