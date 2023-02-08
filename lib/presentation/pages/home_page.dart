import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeyay/injection.dart';
import 'package:freeyay/presentation/widgets/game_card.dart';

import '../bloc/bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameBloc = locator<GameBloc>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: BlocProvider.value(
          value: gameBloc,
          child: Column(
            children: [
              BlocBuilder<GameBloc, GameState>(
                builder: (context, state) {
                  if (state is GameSuccess) {
                    final random = Random().nextInt(10);
                    final game = state.gameList[random];

                    return GameCard(
                      title: game.title,
                      desc: game.description,
                      genre: game.genre,
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
        ),
      ),
    );
  }
}
