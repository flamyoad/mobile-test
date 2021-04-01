import 'dart:convert';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import 'package:errors/errors.dart';

import 'package:qr_generator/qr_generator.dart';

import '../../fixtures/fixture_reader.dart';
import 'qr_generator_repository_test.mocks.dart';

@GenerateMocks([RemoteDataSource, LocalDataSource])
void main() {
  final mockRemoteDataSource = MockRemoteDataSource();
  final mockLocalDataSource = MockLocalDataSource();
  late QrGeneratorRepository repository;

  setUp(() {
    repository = QrGeneratorRepository(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  final tSeedModel =
      SeedModel.fromJson(json.decode(fixture('seed_local.json')));
  final Seed tSeed = tSeedModel;
  group('getSeed', () {
    test(
      '''
          should return remote data when the call to remote data source is successful
        ''',
      () async {
        // arrange
        when(mockRemoteDataSource.getSeed())
            .thenAnswer((_) async => tSeedModel);
        // act
        final result = await repository.getSeed();
        // assert
        verify(mockRemoteDataSource.getSeed());
        expect(result, equals(Right(tSeed)));
      },
    );

    test(
      '''
          should return server failure when the call to remote data source is unsuccessful
        ''',
      () async {
        // arrange
        when(mockRemoteDataSource.getSeed()).thenThrow(ServerException());
        // act
        final result = await repository.getSeed();
        // assert
        verify(mockRemoteDataSource.getSeed());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });

  //TODO fix test
  // test(
  //   'should return locally generated seed',
  //   () async {
  //     // arrange
  //     when(mockLocalDataSource.getLocalGeneratedSeed())
  //         .thenAnswer((_) async => tSeedModel);
  //     // act
  //     final result = await repository.getSeed();
  //     // assert
  //     verifyZeroInteractions(mockRemoteDataSource);
  //     verify(mockLocalDataSource.getLocalGeneratedSeed());
  //     expect(result, equals(Right(tSeed)));
  //   },
  // );

  //TODO fix test

  // test(
  //   'should return CacheFailure when local seed is null',
  //   () async {
  //     // arrange
  //     when(mockLocalDataSource.getLocalGeneratedSeed())
  //         .thenThrow(CacheException());
  //     // act
  //     final result = await repository.getSeed();
  //     // assert
  //     verifyZeroInteractions(mockRemoteDataSource);
  //     verify(mockLocalDataSource.getLocalGeneratedSeed());
  //     expect(result, equals(Left(CacheFailure())));
  //   },
  // );
}
