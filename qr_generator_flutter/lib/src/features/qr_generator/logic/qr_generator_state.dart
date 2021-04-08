import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qr_generator/qr_generator.dart';

part 'qr_generator_state.freezed.dart';

///State representation for QrGeneration process
@freezed
abstract class QrGeneratorState with _$QrGeneratorState {
  /// Data is present state
  const factory QrGeneratorState.data({required Seed seed}) = _Data;

  /// Initial/default state
  const factory QrGeneratorState.initial() = _Initial;

  /// Data is loading state
  const factory QrGeneratorState.loading() = _Loading;

  /// Error when loading data state
  const factory QrGeneratorState.expired() = _Expired;

  /// Error when loading data state
  const factory QrGeneratorState.error([String? message]) = _Error;
}
