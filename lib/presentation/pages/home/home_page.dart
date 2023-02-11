import 'package:flutter/material.dart';
import 'package:freeyay/common/enums.dart';
import 'package:freeyay/injection.dart';
import 'package:freeyay/presentation/bloc/bloc.dart';

import 'views/views.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GameBloc liveGameBloc;
  late GameBloc platformGameBloc;

  @override
  void initState() {
    super.initState();
    liveGameBloc = locator<GameBloc>();
    platformGameBloc = locator<GameBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshPage,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LiveGameView(bloc: liveGameBloc),
                  const SizedBox(height: 20.0),
                  GamesByPlatformView(bloc: platformGameBloc),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _refreshPage() async {
    liveGameBloc.add(OnFetchLiveGames());
    platformGameBloc.add(const OnFetchGamesByPlatform(Platform.all));
  }
}
