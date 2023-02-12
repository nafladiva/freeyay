import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeyay/injection.dart';
import 'package:freeyay/presentation/bloc/bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.gameId,
  });

  final int gameId;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailGameBloc detailBloc;

  @override
  void initState() {
    super.initState();

    detailBloc = locator<DetailGameBloc>();
    detailBloc.add(OnLoadDetailGame(widget.gameId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: detailBloc,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<DetailGameBloc, DetailGameState>(
              bloc: detailBloc,
              builder: (context, state) {
                if (state is DetailGameLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is DetailGameSuccess) {
                  final game = state.game;

                  return Column(
                    children: [
                      CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: game.thumbnail,
                      ),
                      Text(game.title),
                    ],
                  );
                }

                if (state is DetailGameFailed) {
                  final message = state.message;
                  return Text(message ?? '');
                }

                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
