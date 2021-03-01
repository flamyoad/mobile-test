import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:qr_generator/qr_generator.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/logic/qr_scanner_provider.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/views/qr_scanner_page.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/views/qr_scanner_page_i18n.dart';

class MockGetSeed extends Mock implements GetSeed {}

void main() {
  group('QrScannerPage', () {
    GetSeed mockGetSeed;
    setUp(() {
      mockGetSeed = MockGetSeed();
    });

    test('has a route', () {
      expect(QrScannerPage.route(), isA<MaterialPageRoute>());
    });

    testWidgets('renders a QrScannerPage', (tester) async {
      ///act
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: QrScannerPage(),
          ),
        ),
      );

      ///expect
      expect(find.byKey(kScannerBody), findsOneWidget);
    });

    testWidgets('renders a Start Qr Scan button', (tester) async {
      ///act
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: QrScannerPage(),
          ),
        ),
      );

      ///expect
      expect(find.byKey(kQrScanButton), findsOneWidget);
    });

    testWidgets('renders Initial Text for Initial', (tester) async {
      ///act
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: QrScannerPage(),
          ),
        ),
      );

      ///expect
      expect(find.text(kNoCodeScanned.i18n), findsOneWidget);
    });

    testWidgets('renders No Scanned Text for Error', (tester) async {
      ///Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            qrScannerStateNotifierProvider.overrideWithValue(
              QrScannerStateNotifier(
                initialState: const QrScannerState.error(),
              ),
            ),
          ],
          child: const MaterialApp(
            home: QrScannerPage(),
          ),
        ),
      );

      ///Expect
      expect(find.text(kNoCodeScanned.i18n), findsOneWidget);
    });

    testWidgets('renders code text for Data', (tester) async {
      const tCode = 'testCode';

      ///Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            qrScannerStateNotifierProvider.overrideWithValue(
              QrScannerStateNotifier(
                initialState: const QrScannerState.data(code: tCode),
              ),
            ),
          ],
          child: const MaterialApp(
            home: QrScannerPage(),
          ),
        ),
      );

      ///Expect
      expect(find.text(tCode), findsOneWidget);
    });
  });
}
