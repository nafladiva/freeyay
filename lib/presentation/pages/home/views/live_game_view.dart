import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeyay/common/enums.dart';
import 'package:freeyay/injection.dart';
import 'package:freeyay/presentation/bloc/bloc.dart';
import 'package:freeyay/presentation/widgets/widgets.dart';

class LiveGameView extends StatefulWidget {
  const LiveGameView({
    Key? key,
  }) : super(key: key);

  @override
  State<LiveGameView> createState() => _LiveGameViewState();
}

class _LiveGameViewState extends State<LiveGameView> {
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
        children: [
          BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              if (state is GameSuccess) {
                final random = Random().nextInt(10);
                final game = state.gameList[random];

                return GameCard(
                  game: game,
                );
              }

              if (state is GameLoading) {
                return const CircularProgressIndicator();
              }

              return const SizedBox();
            },
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => gameBloc.add(OnFetchLiveGames()),
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
