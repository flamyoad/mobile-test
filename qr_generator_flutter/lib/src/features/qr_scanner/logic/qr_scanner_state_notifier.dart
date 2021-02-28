part of 'qr_scanner_provider.dart';

///Cubit State Hanlder
class QrScannerStateNotifier extends StateNotifier<QrScannerState> {
  ///Create an instace of `StateNotifier` with [QrScannerState]
  QrScannerStateNotifier({
    QrScannerState initialState,
  }) : super(initialState ?? const QrScannerState.initial());

  ///Get seed from api
  Future<void> scanQr() async {
    try {
      final code = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      state = QrScannerState.data(code: code);
    } on PlatformException {
      state = const QrScannerState.error();
    }
  }
}
