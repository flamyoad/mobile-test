import 'package:bloc/bloc.dart';
import 'package:qr_generator/qr_generator.dart';
import 'qr_generator_state.dart';

///Cubit State Hanlder
class QrGeneratorCubit extends Cubit<QrGeneratorState> {
  ///Create an instace of `Cubit` with [QrGeneratorState]
  QrGeneratorCubit({
    required QrScanner getSeed,
  })   : _getSeed = getSeed,
        super(const QrGeneratorState.initial());

  final QrScanner _getSeed;

  ///Get seed from api
  Future<void> getSeed() async {
    emit(const QrGeneratorState.loading());
    final failureOrSeed = await _getSeed();

    failureOrSeed.fold(
      (l) => emit(const QrGeneratorState.error()),
      (r) => emit(QrGeneratorState.data(seed: r)),
    );
  }

  ///Expire the QrCode
  void expireCode() {
    emit(const QrGeneratorState.expired());
  }
}
