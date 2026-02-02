import 'dart:async';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:data/data.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      await Hive.initFlutter();
      await EnvironmentConfigManager.initialize();
      final currentConfig = EnvironmentConfigManager.getCurrentEnvironment();

      AppLogger.configure(
        isProduction: true,
        logFormat: LogFormat.extended,
        environment: currentConfig.environment.name.toString().toUpperCase(),
        telegramBotToken: Env.TELEGRAM_BOT_TOKEN,
        telegramChatId: int.tryParse(Env.TELEGRAM_CHAT_ID),
      );
      FlutterError.onError = (errorDetails) {
        Zone.current.handleUncaughtError(
          errorDetails.exception,
          errorDetails.stack ?? StackTrace.empty,
        );
      };

      PlatformDispatcher.instance.onError = (error, stack) {
        Zone.current.handleUncaughtError(error, stack);
        return true; // Mark as handled error to avoid multiple reports on TG
      };

      await initializeApp(
        useDeviceLocale: true,
        currentEnvironment: currentConfig,
      );
    },
    (error, stackTrace) {
      // THIS IS NOW THE *ONLY* GLOBAL LOGGER
      // All uncaught errors from Flutter, platform, or async end up here.
      // This ensures only ONE entry is sent to Telegram.
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
