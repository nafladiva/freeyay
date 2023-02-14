import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'injection.dart' as di;
import 'common/common.dart';
import 'data/models/models.dart';
import 'presentation/bloc/bloc.dart';
import 'presentation/pages/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter<GameMdl>(GameMdlAdapter());
  await Hive.openBox<GameMdl>(Constant.favoriteBox);

  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.locator<FavoriteBloc>(),
      child: MaterialApp(
        title: Constant.appName,
        theme: Themes.myTheme,
        home: const HomePage(),
      ),
    );
  }
}
