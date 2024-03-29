import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/presentation/bloc/bloc.dart';
import 'package:freeyay/presentation/widgets/widgets.dart';

class LiveGameView extends StatefulWidget {
  final GameBloc bloc;

  const LiveGameView({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  State<LiveGameView> createState() => _LiveGameViewState();
}

class _LiveGameViewState extends State<LiveGameView> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(const OnFetchGamesByPlatform(Platform.all));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Live Games',
          style: TStyles.heading1(),
        ),
        const SizedBox(height: 20.0),
        BlocBuilder<GameBloc, GameState>(
          bloc: widget.bloc,
          builder: (context, state) {
            if (state is GameSuccess) {
              final games = state.gameList.take(10);

              return ScrollableHorizontalView(
                children: [
                  ...games.map(
                    (game) => GameCard(game: game),
                  ),
                ],
              );
            }

            if (state is GameLoading) return const GameListLoader();

            return const SizedBox();
          },
        ),
        const SizedBox(height: 30.0),
      ],
    );
  }
}
