import 'dart:ffi';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:qr_generator/qr_generator.dart';
import 'package:qr_generator_flutter/src/core/widgets/animated_floating_action_button.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/logic/qr_generator_cubit.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/logic/qr_generator_state.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/qr_generator_page.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/qr_generator_page_i18n.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/logic/qr_scanner_cubit.dart';
import 'package:qr_generator_flutter/src/features/qr_scanner/logic/qr_scanner_state.dart'
    as scanner_s;
import 'package:qr_generator_flutter/src/features/qr_scanner/views/qr_scanner_page.dart';
import 'package:qr_generator_flutter/src/features/qr_generator/views/widgets/qr_code_widget.dart';

class MockQrGeneratorCubit extends MockCubit<QrGeneratorState>
    implements QrGeneratorCubit {}

class MockQrScannerCubit extends MockCubit<scanner_s.QrScannerState>
    implements QrScannerCubit {}

class FakeQrGeneratorState extends Fake implements QrGeneratorState {}

class FakeQrScannerState extends Fake implements scanner_s.QrScannerState {}

void main() {
  setUpAll(() {
    registerFallbackValue<QrGeneratorState>(FakeQrGeneratorState());
    registerFallbackValue<scanner_s.QrScannerState>(FakeQrScannerState());
  });
  group('QrGeneratorPage', () {
    final tSeed = Seed(
      seed: 'seed',
      expiresAt: DateTime.now().add(const Duration(seconds: 15)),
    );

    late QrGeneratorCubit qrGeneratorCubit;
    late QrScannerCubit qrScannerCubit;

    setUp(() {
      qrGeneratorCubit = MockQrGeneratorCubit();
      qrScannerCubit = MockQrScannerCubit();
    });

    test('has a route', () {
      expect(QrGeneratorPage.route(), isA<MaterialPageRoute>());
    });

    testWidgets('renders a QrGeneratorPage', (tester) async {
      ///arrange
      when(() => qrGeneratorCubit.state)
          .thenReturn(const QrGeneratorState.initial());

      ///act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///expect
      expect(find.byKey(kBodyKey), findsOneWidget);
    });

    testWidgets('renders Initial Text for Initial', (tester) async {
      ///Arrange
      when(() => qrGeneratorCubit.state)
          .thenReturn(const QrGeneratorState.initial());

      ///act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///expect
      expect(find.text(kWelcomeText.i18n), findsOneWidget);
    });

    testWidgets('renders CircularProgress for Loading', (tester) async {
      ///Arrange
      when(() => qrGeneratorCubit.state)
          .thenReturn(const QrGeneratorState.loading());

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///Expect
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders QrWidget for Data', (tester) async {
      ///Arrange
      when(() => qrGeneratorCubit.state)
          .thenReturn(QrGeneratorState.data(seed: tSeed));

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///Expect
      expect(find.byType(QrCodeWidget), findsOneWidget);
    });

    testWidgets('renders Error Text for Error', (tester) async {
      ///Arrange
      when(() => qrGeneratorCubit.state)
          .thenReturn(const QrGeneratorState.error());

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///Expect
      expect(find.text(kError.i18n), findsOneWidget);
    });

    testWidgets('renders Expired Text for Expired', (tester) async {
      ///Arrange
      when(() => qrGeneratorCubit.state)
          .thenReturn(const QrGeneratorState.expired());

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      ///Expect
      expect(find.text(kCodeExpired.i18n), findsOneWidget);
    });

    testWidgets('call GetSeedMethod when Generate Qr button is pressed',
        (tester) async {
      ///Arrange
      when(() => qrGeneratorCubit.state)
          .thenReturn(const QrGeneratorState.initial());
      when(() => qrScannerCubit.state)
          .thenReturn(const scanner_s.QrScannerState.initial());

      when(() => qrGeneratorCubit.getSeed()).thenAnswer((_) async => Void);

      ///Act
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider.value(value: qrGeneratorCubit),
          BlocProvider.value(value: qrScannerCubit),
        ],
        child: const MaterialApp(home: QrGeneratorPage()),
      ));
      await tester.tap(find.byKey(kPrimaryFloatingActionButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(kGenerateQrButtonKey));
      await tester.pumpAndSettle();

      ///Expect
      verify(() => qrGeneratorCubit.getSeed()).called(1);
    });

    testWidgets('navigates to QrScanPage when scan icon is tapped',
        (tester) async {
      ///Arrange
      when(() => qrGeneratorCubit.state)
          .thenReturn(const QrGeneratorState.initial());
      when(() => qrScannerCubit.state)
          .thenReturn(const scanner_s.QrScannerState.initial());

      ///Act
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider.value(value: qrGeneratorCubit),
          BlocProvider.value(value: qrScannerCubit),
        ],
        child: const MaterialApp(home: QrGeneratorPage()),
      ));
      await tester.tap(find.byKey(kPrimaryFloatingActionButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(kScannerPageButtonKey));
      await tester.pumpAndSettle();

      ///Expect
      expect(find.byType(QrScannerPage), findsOneWidget);
    });

    testWidgets('navigates to QrScanPage when scan icon is tapped',
        (tester) async {
      ///Arrange
      when(() => qrGeneratorCubit.state)
          .thenReturn(const QrGeneratorState.initial());
      when(() => qrScannerCubit.state)
          .thenReturn(const scanner_s.QrScannerState.initial());

      ///Act
      await tester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider.value(value: qrGeneratorCubit),
          BlocProvider.value(value: qrScannerCubit),
        ],
        child: const MaterialApp(home: QrGeneratorPage()),
      ));
      await tester.tap(find.byKey(kPrimaryFloatingActionButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(kScannerPageButtonKey));
      await tester.pumpAndSettle();

      ///Expect
      expect(find.byType(QrScannerPage), findsOneWidget);
    });

    testWidgets(
        'forward and reverse the animation when floating action button is pressed',
        (tester) async {
      ///Arrange
      when(() => qrGeneratorCubit.state)
          .thenReturn(const QrGeneratorState.initial());

      ///Act
      await tester.pumpWidget(BlocProvider.value(
        value: qrGeneratorCubit,
        child: const MaterialApp(home: QrGeneratorPage()),
      ));

      await tester.tap(find.byKey(kPrimaryFloatingActionButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(kScannerPageButtonKey), findsOneWidget);
      await tester.tap(find.byKey(kPrimaryFloatingActionButtonKey));
    });
  });
}
