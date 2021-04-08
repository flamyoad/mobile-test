import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:qr_generator/qr_generator.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/logic/qr_generator_cubit.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/logic/qr_generator_state.dart';

class MockGetSeed extends Mock implements GetSeed {}

void main() {
  group('QrGeneratorCubit', () {
    late MockGetSeed mockGetSeed;

    setUp(() {
      mockGetSeed = MockGetSeed();
    });

    test('initial state is Initial', () {
      expect(QrGeneratorCubit(getSeed: mockGetSeed).state,
          const QrGeneratorState.initial());
    });

    group('getSeed', () {
      final tSeed = Seed(seed: 'seed', expiresAt: DateTime(2021, 2, 26));

      blocTest<QrGeneratorCubit, QrGeneratorState>(
        'should get data from getSeed use case',
        build: () {
          when(() => mockGetSeed()).thenAnswer((_) async => Right(tSeed));
          return QrGeneratorCubit(getSeed: mockGetSeed);
        },
        act: (cubit) => cubit.getSeed(),
        verify: (_) {
          verify(() => mockGetSeed()).called(1);
        },
      );
      blocTest<QrGeneratorCubit, QrGeneratorState>(
        'emits [Loading, Data] '
        'when getSeed succeed',
        build: () {
          when(() => mockGetSeed()).thenAnswer((_) async => Right(tSeed));
          return QrGeneratorCubit(getSeed: mockGetSeed);
        },
        act: (cubit) => cubit.getSeed(),
        expect: () => <QrGeneratorState>[
          const QrGeneratorState.loading(),
          QrGeneratorState.data(seed: tSeed),
        ],
        verify: (_) {
          verify(() => mockGetSeed()).called(1);
        },
      );

      blocTest<QrGeneratorCubit, QrGeneratorState>(
        'emits [Loading, Error] '
        'when getSeed fails',
        build: () {
          when(() => mockGetSeed())
              .thenAnswer((_) async => Left(ServerFailure()));
          return QrGeneratorCubit(getSeed: mockGetSeed);
        },
        act: (cubit) => cubit.getSeed(),
        expect: () => <QrGeneratorState>[
          const QrGeneratorState.loading(),
          const QrGeneratorState.error(),
        ],
        verify: (_) {
          verify(() => mockGetSeed()).called(1);
        },
      );
    });
  });
}
