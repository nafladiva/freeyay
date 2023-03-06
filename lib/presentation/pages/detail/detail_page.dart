import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeyay/injection.dart';
import 'package:freeyay/presentation/bloc/bloc.dart';

import 'views/views.dart';

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
        body: RefreshIndicator(
          onRefresh: _refreshPage,
          child: BlocBuilder<DetailGameBloc, DetailGameState>(
            bloc: detailBloc,
            builder: (context, state) {
              if (state is DetailGameLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is DetailGameSuccess) {
                return BodyView(
                  game: state.game,
                  isFavorite: state.isFavorite,
                );
              }

              if (state is DetailGameFailed) {
                return Text(state.message);
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Future<void> _refreshPage() async {
    detailBloc.add(OnLoadDetailGame(widget.gameId));
  }
}
