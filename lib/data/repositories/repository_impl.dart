import 'package:freeyay/common/exceptions.dart';
import 'package:freeyay/data/sources/remote_data_source.dart';
import 'package:freeyay/domain/entities/game.dart';
import 'package:freeyay/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:freeyay/domain/repositories/repository.dart';

import '../../common/enums.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Game>>> getLiveGame() async {
    try {
      final result = await remoteDataSource.getLiveGames();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure());
    } on DataException {
      return Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, List<Game>>> getGamesByPlatform(
      Platform platform) async {
    try {
      final result = await remoteDataSource.getGamesByPlatform(platform);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure());
    } on DataException {
      return Left(DataFailure());
    }
  }
}
