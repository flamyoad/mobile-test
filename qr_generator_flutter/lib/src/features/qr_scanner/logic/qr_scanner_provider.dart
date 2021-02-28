//* Inject Logic Generator Code Holder / StateNotifier
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:riverpod/riverpod.dart';

import 'qr_scanner_state.dart';
export 'qr_scanner_state.dart';

part 'qr_scanner_state_notifier.dart';

///Qr Scanner state notifier
final qrScannerStateNotifierProvider =
    StateNotifierProvider<QrScannerStateNotifier>(
  (ref) => QrScannerStateNotifier(),
);
