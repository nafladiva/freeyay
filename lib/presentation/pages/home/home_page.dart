import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeyay/common/common.dart';
import 'package:freeyay/injection.dart';
import 'package:freeyay/presentation/bloc/bloc.dart';
import 'package:hive/hive.dart';

import 'views/views.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GameBloc liveGameBloc;
  late GameBloc platformGameBloc;
  late FavoriteBloc favoriteBloc;

  @override
  void initState() {
    super.initState();
    liveGameBloc = locator<GameBloc>();
    platformGameBloc = locator<GameBloc>();
    favoriteBloc = locator<FavoriteBloc>();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: liveGameBloc),
        BlocProvider.value(value: platformGameBloc),
        BlocProvider.value(value: favoriteBloc),
      ],
      child: Scaffold(
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
                    GamesByPlatformView(bloc: platformGameBloc),
                    YourFavoriteView(bloc: favoriteBloc),
                  ],
                ),
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
    favoriteBloc.add(OnLoadFavorite());
  }
}
