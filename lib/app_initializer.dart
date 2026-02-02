import 'dart:async';
import 'package:driver_app/app.dart';
import 'package:driver_app/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterDisplayMode.setHighRefreshRate().catchError((_) => Future.value());
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );
  runApp(const AppProviders(child: App()));
}
