import 'package:freeyay/common/common.dart';
import 'package:freeyay/data/sources/sources.dart';
import 'package:freeyay/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';
import 'package:freeyay/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

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

  @override
  Future<Either<Failure, Game>> getDetailGame(int gameId) async {
    try {
      final result = await remoteDataSource.getDetailGame(gameId);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure());
    } on DataException {
      return Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, List<Game>>> getFavoriteGames() async {
    try {
      final result = await localDataSource.getAllFavoriteGames();
      return Right(result);
    } on DataException {
      return Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, String>> addFavorite(Game game) async {
    try {
      await localDataSource.addFavorite(game);
      return const Right('Berhasil menambahkan favorite');
    } on DataException {
      return Left(DataFailure());
    }
  }

  @override
  Future<Either<Failure, String>> removeFavorite(Game game) async {
    try {
      await localDataSource.removeFavorite(game);
      return const Right('Berhasil menghapus favorite');
    } on DataException {
      return Left(DataFailure());
    }
  }

  @override
  Future<bool> checkFavoriteStatus(Game game) async {
    try {
      final result = await localDataSource.checkFavoriteStatus(game);
      return result;
    } on DataException {
      return false;
    }
  }
}
