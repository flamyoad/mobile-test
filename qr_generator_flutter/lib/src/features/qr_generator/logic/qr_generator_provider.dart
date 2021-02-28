import 'package:meta/meta.dart';
import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';

import 'package:network_manager/network_manager.dart';
import 'package:qr_generator/qr_generator.dart';

import 'package:qr_generator_flutter/src/core/env/enviroment_config.dart';

import 'qr_generator_state.dart';
export 'qr_generator_state.dart';

part 'qr_generator_state_notifier.dart';

final _qrGeneratorRepositoryProvider = Provider<IQrGeneratorRepository>(
  (ref) => QrGeneratorRepository(
    remoteDataSource: RemoteDataSource(
      client: Dio(),
      url: '${EnvironmentConfig.apiUrl}/seed',
    ),
    localDataSource: LocalDataSource(),
    networkManager: NetworkManager(
      DataConnectionChecker(),
    ),
  ),
);

//* Inject UseCases
final _getSeedUseCaseProvider = Provider<GetSeed>(
  (ref) => GetSeed(
    repository: ref.watch(_qrGeneratorRepositoryProvider),
  ),
);

///* Inject Logic Generator Code Holder / StateNotifier
final qrGeneratorStateNotifierProvider =
    StateNotifierProvider<QrGeneratorStateNotifier>(
  (ref) => QrGeneratorStateNotifier(
    getSeed: ref.watch(_getSeedUseCaseProvider),
  ),
);
