import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:qr_generator/qr_generator.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/qr_generator_page.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/qr_generator_page_i18n.dart';

import 'package:qr_generator_flutter/src/features/qr_generator/logic/qr_generator_provider.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/logic/qr_scanner_provider.dart'
    as scanner;
import 'package:qr_generator_flutter/src/features/qr_scanner/views/qr_scanner_page.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/widgets/qr_code_widget.dart';

class MockGetSeed extends Mock implements GetSeed {}

class MockQrGeneratorStateNotifier extends Mock
    implements QrGeneratorStateNotifier {}

void main() {
  GetSeed mockGetSeed;
  QrGeneratorStateNotifier mockQrGeneratorStateNotifier;

  setUp(() {
    mockGetSeed = MockGetSeed();
    mockQrGeneratorStateNotifier = MockQrGeneratorStateNotifier();
  });

  group('QrGeneratorPage', () {
    final tSeed = Seed(
      seed: 'seed',
      expiresAt: DateTime.now().add(const Duration(seconds: 15)),
    );

    test('has a route', () {
      expect(QrGeneratorPage.route(), isA<MaterialPageRoute>());
    });

    testWidgets('renders a QrGeneratorPage', (tester) async {
      ///act
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: QrGeneratorPage()),
        ),
      );

      ///expect
      expect(find.byKey(const Key('kBodyKey')), findsOneWidget);
    });

    testWidgets('renders Initial Text for Initial', (tester) async {
      ///act
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: QrGeneratorPage()),
        ),
      );

      ///expect
      expect(find.text(kWelcomeText.i18n), findsOneWidget);
    });

    testWidgets('renders Circular Progress for Loading', (tester) async {
      ///act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            qrGeneratorStateNotifierProvider.overrideWithValue(
              QrGeneratorStateNotifier(
                getSeed: mockGetSeed,
                initialState: const QrGeneratorState.loading(),
              ),
            )
          ],
          child: const MaterialApp(home: QrGeneratorPage()),
        ),
      );

      ///expect
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders QrWidget for Data', (tester) async {
      ///act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            qrGeneratorStateNotifierProvider.overrideWithValue(
              QrGeneratorStateNotifier(
                getSeed: mockGetSeed,
                initialState: QrGeneratorState.data(seed: tSeed),
              ),
            )
          ],
          child: const MaterialApp(home: QrGeneratorPage()),
        ),
      );

      ///expect
      expect(find.byType(QrCodeWidget), findsOneWidget);
    });

    testWidgets('renders Error Text for Error', (tester) async {
      ///act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            qrGeneratorStateNotifierProvider.overrideWithValue(
              QrGeneratorStateNotifier(
                getSeed: mockGetSeed,
                initialState: const QrGeneratorState.error(),
              ),
            )
          ],
          child: const MaterialApp(home: QrGeneratorPage()),
        ),
      );

      ///expect
      expect(find.text(kError.i18n), findsOneWidget);
    });

    testWidgets('renders Expired Text for Expired', (tester) async {
      ///act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            qrGeneratorStateNotifierProvider.overrideWithValue(
              QrGeneratorStateNotifier(
                getSeed: mockGetSeed,
                initialState: const QrGeneratorState.expired(),
              ),
            )
          ],
          child: const MaterialApp(home: QrGeneratorPage()),
        ),
      );

      ///expect
      expect(find.text(kCodeExpired.i18n), findsOneWidget);
    });

    testWidgets('navigates to QrScanPage when scan icon is tapped',
        (tester) async {
      ///act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            qrGeneratorStateNotifierProvider.overrideWithValue(
              QrGeneratorStateNotifier(
                getSeed: mockGetSeed,
                initialState: const QrGeneratorState.expired(),
              ),
            ),
          ],
          child: const MaterialApp(home: QrGeneratorPage()),
        ),
      );

      ///expect
      expect(find.text(kCodeExpired.i18n), findsOneWidget);
    });

    testWidgets('navigates to QrScanPage when scan icon is tapped',
        (tester) async {
      ///Act
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: QrGeneratorPage()),
        ),
      );
      await tester.tap(find.byKey(const Key('kPrimaryFloatingButton')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('kScanQrButton')));
      await tester.pumpAndSettle();

      ///Expect
      expect(find.byType(QrScannerPage), findsOneWidget);
    });

    testWidgets('triggers getSeed when generate qr button is pressed',
        (tester) async {
      ///Arrange
      when(mockGetSeed()).thenAnswer((_) async => {});

      ///Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            qrGeneratorStateNotifierProvider.overrideWithValue(
              QrGeneratorStateNotifier(
                getSeed: mockGetSeed,
                initialState: const QrGeneratorState.expired(),
              ),
            ),
          ],
          child: const MaterialApp(home: QrGeneratorPage()),
        ),
      );

      await tester.tap(find.byKey(const Key('kPrimaryFloatingButton')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('kGenerateQrButton')));
      await tester.pumpAndSettle();

      verify(mockGetSeed()).called(1);
    });
  });
}
