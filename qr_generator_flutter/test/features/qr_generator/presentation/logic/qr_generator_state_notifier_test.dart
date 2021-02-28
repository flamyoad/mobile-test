import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:qr_generator/qr_generator.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/logic/qr_generator_provider.dart';

class MockGetSeed extends Mock implements GetSeed {}

class Listener extends Mock {
  void call(QrGeneratorState state);
}

void main() {
  group('QrGeneratorStateNotifier', () {
    MockGetSeed mockGetSeed;

    setUp(() {
      mockGetSeed = MockGetSeed();
    });

    test('throws AssertionError when GetSeed is null', () {
      expect(() => QrGeneratorStateNotifier(getSeed: null),
          throwsA(isA<AssertionError>()));
    });

    test(
      'initial state is QrGeneratorState',
      () {
        expect(
          QrGeneratorStateNotifier(getSeed: mockGetSeed).currentState,
          const QrGeneratorState.initial(),
        );
      },
    );

    group('getSeed', () {
      test('should get data from getSeed use case', () {
        final tSeed = Seed(seed: 'seed', expiresAt: DateTime(2021, 2, 26));

        final notifier = QrGeneratorStateNotifier(getSeed: mockGetSeed);
        final listener = Listener();
        notifier.addListener(listener);

        when(mockGetSeed()).thenAnswer((_) async => Right(tSeed));

        verify(listener(const QrGeneratorState.initial())).called(1);

        notifier.getSeed();

        verify(mockGetSeed()).called(1);
        // verifyNoMoreInteractions(listener);
      });

      test(
          'emits [QrGeneratorState.loading, QrGeneratorState.data] when getSeed success',
          () async {
        /// Setup
        final tSeed = Seed(seed: 'seed', expiresAt: DateTime(2021, 2, 26));
        final notifier = QrGeneratorStateNotifier(getSeed: mockGetSeed);
        final stream = notifier.stream;

        when(mockGetSeed()).thenAnswer((_) async => Right(tSeed));

        ///Act
        // ignore: unawaited_futures
        Future.microtask(notifier.getSeed);

        ///Expect
        await expectLater(
          stream,
          emitsInOrder(
            <QrGeneratorState>[
              const QrGeneratorState.loading(),
              QrGeneratorState.data(seed: tSeed),
            ],
          ),
        );

        notifier.dispose();
        await expectLater(stream, emitsDone);
      });

      test(
          'emits [QrGeneratorState.loading, QrGeneratorState.error] when getSeed fails',
          () async {
        /// Setup
        final notifier = QrGeneratorStateNotifier(getSeed: mockGetSeed);
        final stream = notifier.stream;

        when(mockGetSeed()).thenAnswer((_) async => Left(ServerFailure()));

        ///Act
        // ignore: unawaited_futures
        Future.microtask(notifier.getSeed);

        ///Expect
        await expectLater(
          stream,
          emitsInOrder(
            <QrGeneratorState>[
              const QrGeneratorState.loading(),
              const QrGeneratorState.error(),
            ],
          ),
        );

        notifier.dispose();
        await expectLater(stream, emitsDone);
      });
    });
  });
}
