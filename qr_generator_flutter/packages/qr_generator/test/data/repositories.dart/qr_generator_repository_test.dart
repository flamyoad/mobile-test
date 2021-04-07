import 'dart:convert';
import 'package:mocktail/mocktail.dart';
import 'package:network_manager/network_manager.dart';
import 'package:test/test.dart';

import 'package:dartz/dartz.dart';

import 'package:errors/errors.dart';

import 'package:qr_generator/qr_generator.dart';

import '../../fixtures/fixture_reader.dart';

class MockRemoteDataSource extends Mock implements IRemoteDataSource {}

class MockLocalDataSource extends Mock implements ILocalDataSource {}

class MockNetworkManager extends Mock implements INetworkManager {}

void main() {
  final _mockRemoteDataSource = MockRemoteDataSource();
  final _mockLocalDataSource = MockLocalDataSource();
  final _mockNetworkManager = MockNetworkManager();
  late QrGeneratorRepository repository;

  setUp(() {
    repository = QrGeneratorRepository(
      remoteDataSource: _mockRemoteDataSource,
      localDataSource: _mockLocalDataSource,
      networkManager: _mockNetworkManager,
    );
  });

  final tSeedModel =
      SeedModel.fromJson(json.decode(fixture('seed_local.json')));

  final Seed tSeed = tSeedModel;
  group('getSeed', () {
    group('When is connected', () {
      setUp(() {
        when(() => _mockNetworkManager.isConnected)
            .thenAnswer((_) async => true);
      });

      test(
        '''
          should return remote data when the call to remote data source is successful
        ''',
        () async {
          // arrange
          when(() => _mockRemoteDataSource.getSeed())
              .thenAnswer((_) async => tSeedModel);
          // act
          final result = await repository.getSeed();
          // assert
          verify(() => _mockRemoteDataSource.getSeed());
          verifyZeroInteractions(_mockLocalDataSource);
          expect(result, equals(Right(tSeed)));
        },
      );

      test(
        '''
          should return server failure when the call to remote data source is unsuccessful
        ''',
        () async {
          // arrange
          when(() => _mockRemoteDataSource.getSeed())
              .thenThrow(ServerException());
          // act
          final result = await repository.getSeed();
          // assert
          verify(() => _mockRemoteDataSource.getSeed());
          verifyZeroInteractions(_mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    group('When is NOT connected', () {
      setUp(() {
        when(() => _mockNetworkManager.isConnected)
            .thenAnswer((_) async => false);
      });

      test(
        '''
          should return locally generated seed
        ''',
        () async {
          // arrange
          when(() => _mockLocalDataSource.getLocalGeneratedSeed())
              .thenAnswer((_) async => tSeedModel);
          // act
          final result = await repository.getSeed();
          // assert
          // verifyZeroInteractions(_mockRemoteDataSource);
          // TODO: Check this line
          verify(() => _mockLocalDataSource.getLocalGeneratedSeed());
          expect(result, equals(Right(tSeed)));
        },
      );

      test(
        'should return CacheFailure when local seed is null',
        () async {
          // arrange
          when(() => _mockLocalDataSource.getLocalGeneratedSeed())
              .thenThrow(CacheException());
          // act
          final result = await repository.getSeed();
          // assert
          // verifyZeroInteractions(_mockRemoteDataSource);
          verify(() => _mockLocalDataSource.getLocalGeneratedSeed());
          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
