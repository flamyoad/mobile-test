import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import '../../domain/domain.dart';

import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';

/// QrGenerator repository implementation
class QrGeneratorRepository implements IQrGeneratorRepository {
  /// QrGenerator repository constructor
  QrGeneratorRepository({
    required ILocalDataSource localDataSource,
    required IRemoteDataSource remoteDataSource,
  })   : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  final ILocalDataSource _localDataSource;
  final IRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Seed>> getSeed() async {
    try {
      final remoteSeed = await _remoteDataSource.getSeed();
      return Right(remoteSeed);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
