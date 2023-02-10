import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeyay/common/enums.dart';
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
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  gameBloc.add(const OnFetchGamesByPlatform(Platform.all));
                },
                child: const Text('All'),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  gameBloc.add(const OnFetchGamesByPlatform(Platform.pc));
                },
                child: const Text('PC'),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  gameBloc.add(const OnFetchGamesByPlatform(Platform.browser));
                },
                child: const Text('Browser'),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
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
