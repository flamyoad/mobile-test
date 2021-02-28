import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_scanner_state.freezed.dart';

///State representation for QrScanner process
@freezed
abstract class QrScannerState with _$QrScannerState {
  /// Initial/default state
  const factory QrScannerState.initial() = _Initial;

  /// Data is present state
  const factory QrScannerState.data({@required String code}) = _Data;

  /// Error when loading data state
  const factory QrScannerState.error() = _Error;
}
