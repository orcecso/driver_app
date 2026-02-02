import 'dart:async';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'app_initializer.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      await Hive.initFlutter();

      await initializeApp();
    },
    (error, stackTrace) {
      // THIS IS NOW THE *ONLY* GLOBAL LOGGER
      // All uncaught errors from Flutter, platform, or async end up here.
      // This ensures only ONE entry is sent to Telegram.
    },
  );
}
