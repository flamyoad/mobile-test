import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:qr_generator_flutter/src/features/qr_scanner/logic/qr_scanner_cubit.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/logic/qr_scanner_state.dart';

void main() {
  group('QrScannerCubit', () {
    test('initial state is Initial', () {
      expect(
        QrScannerCubit().state,
        const QrScannerState.initial(),
      );
    });

    //TODO: Fix DI for BarCodeScanner to improve testing
    // group('scanQr', () {
    //   blocTest<QrScannerCubit, QrScannerState>(
    //     'should emit expired',
    //     build: () {
    //       return QrScannerCubit();
    //     },
    //     act: (cubit) => cubit.expireCode(),
    //     expect: () => <QrScannerState>[
    //       const QrScannerState.expired(),
    //     ],
    //   );
    // });
  });
}
