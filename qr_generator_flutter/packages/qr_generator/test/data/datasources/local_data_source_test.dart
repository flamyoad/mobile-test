import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';

import 'package:errors/errors.dart';
import 'package:qr_generator/qr_generator.dart';

import 'local_data_source_test.mocks.dart';

@GenerateMocks([ILocalDataSource])
void main() {
  final dataSource = MockILocalDataSource();

  group('get locally generated Seed', () {
    final tSeed = SeedModel(
      seed: 'seed',
      expiresAt: DateTime.now(),
    );

    test(
      'should return locally generated Seed when ther is no internet',
      () async {
        // arrange
        when(dataSource.getLocalGeneratedSeed()).thenAnswer(
          (_) async => tSeed,
        );
        // act
        final result = await dataSource.getLocalGeneratedSeed();

        // assert
        verify(dataSource.getLocalGeneratedSeed());
        expect(result, equals(tSeed));
      },
    );

    test(
      'should throw a CacheExeption if seed is null',
      () async {
        // arrange
        when(dataSource.getLocalGeneratedSeed()).thenThrow(
          CacheException(),
        );
        // act
        final call = dataSource.getLocalGeneratedSeed;
        // assert
        expect(call, throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });
}
