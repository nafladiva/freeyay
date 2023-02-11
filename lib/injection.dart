import 'package:freeyay/data/repositories/repository_impl.dart';
import 'package:freeyay/data/sources/sources.dart';
import 'package:freeyay/domain/repositories/repository.dart';
import 'package:freeyay/domain/usecases/usecases.dart';
import 'package:get_it/get_it.dart';

import 'presentation/bloc/bloc.dart';

final locator = GetIt.instance;

void init() {
  //Bloc
  locator.registerFactory(() => GameBloc(locator(), locator()));

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
