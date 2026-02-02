import 'dart:async';
import 'app_initializer.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      await initializeApp();
    },
    (error, stackTrace) {
      // THIS IS NOW THE *ONLY* GLOBAL LOGGER
      // All uncaught errors from Flutter, platform, or async end up here.
    },
  );
}
