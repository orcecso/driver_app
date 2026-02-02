import 'dart:async';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:data/data.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      await Hive.initFlutter();
      await EnvironmentConfigManager.initialize(allowSwitching: true);
      final currentConfig = EnvironmentConfigManager.getCurrentEnvironment();

      await initializeApp(
        useDeviceLocale: true,
        currentEnvironment: currentConfig,
      );
    },
    (error, stackTrace) {
      // THIS IS NOW THE *ONLY* GLOBAL LOGGER
      // All uncaught errors from Flutter, platform, or async end up here.
      final log = AppLogger.getLogger('GlobalCatcher');
      log.errorWithContext(
        error,
        stackTrace,
        operation: 'GlobalCatcher',
        fatal: true,
      );
    },
  );
}
