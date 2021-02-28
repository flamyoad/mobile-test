part of 'qr_generator_provider.dart';

///Cubit State Hanlder
class QrGeneratorStateNotifier extends StateNotifier<QrGeneratorState> {
  ///Create an instace of `State Notifier` with [QrGeneratorState]
  QrGeneratorStateNotifier({
    @required GetSeed getSeed,
  })  : assert(getSeed != null),
        _getSeed = getSeed,
        super(const QrGeneratorState.initial());

  final GetSeed _getSeed;

  ///Get seed from api
  Future<void> getSeed() async {
    state = const QrGeneratorState.loading();
    final failureOrSeed = await _getSeed();

    failureOrSeed.fold(
      (l) => state = const QrGeneratorState.error(),
      (r) => state = QrGeneratorState.data(seed: r),
    );
  }

  ///Expire the QrCode
  void expireCode() {
    state = const QrGeneratorState.expired();
  }
}
