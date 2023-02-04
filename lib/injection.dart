import 'package:freeyay/data/repositories/repository_impl.dart';
import 'package:freeyay/data/sources/remote_data_source.dart';
import 'package:freeyay/domain/repositories/repository.dart';
import 'package:freeyay/domain/usecases/get_games_by_platform.dart';
import 'package:freeyay/domain/usecases/get_live_games.dart';
import 'package:freeyay/presentation/bloc/game_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //Bloc
  locator.registerFactory(() => GameBloc(locator()));

  //Use Cases
  locator.registerLazySingleton(() => GetLiveGames(locator()));
  locator.registerLazySingleton(() => GetGamesByPlatform(locator()));

  //Repository
  locator.registerLazySingleton<Repository>(
    () => RepositoryImpl(remoteDataSource: locator()),
  );

  //Remote Data Source
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
}
