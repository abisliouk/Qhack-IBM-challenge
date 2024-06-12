import 'package:get_it/get_it.dart';
import 'package:gptparty_frontend/src/services/onboarding_generator_service.dart';

import '../logger/logger.dart';
import 'connection_status_service.dart';

OnboardingGenerationService get imageProcessingService =>
    GetIt.I<OnboardingGenerationService>();

Logger get appLog => GetIt.I<Logger>(instanceName: 'global-logger');

ConnectionStatusService get connectionStatusService =>
    GetIt.I<ConnectionStatusService>();

bool _configured = false;

Future<void> configureServices() async {
  if (_configured) {
    return;
  }

  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<Logger>(getLogger('Global'),
      instanceName: 'global-logger');
  getIt.registerSingleton<ConnectionStatusService>(
      ConnectionStatusService('example.com'));
  getIt.registerLazySingleton<OnboardingGenerationService>(
      () => OnboardingGenerationServiceImpl());

  _configured = true;
}
