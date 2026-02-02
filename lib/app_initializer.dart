import 'dart:async';
import 'dart:io';
import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> initializeApp({
  required bool useDeviceLocale,
  required EnvironmentConfig currentEnvironment,
}) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Hive.initFlutter();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    if (e.toString().contains('already exists')) {
      debugPrint('Firebase already initialized, skipping initialization');
    } else {
      rethrow;
    }
  }

  AppConfig.setEnvironment(currentEnvironment.environment);

  final tokenStorage = InMemoryTokenStorage();
  final paymentMethodCacheService = PaymentMethodCacheService();
  final notificationService = NotificationService();
  final appConfigStorage = InMemoryAppConfigStorage();
  final secureStorage = SecureStorage();
  final customTotp = CustomTotp();

  final cryptographyService = CryptographyService(
    baseSecretKey: Env.SECRET_KEY,
    tokenStorage: tokenStorage,
    customTotp: customTotp,
  );

  final apiConfig = BaseProviderConfig(
    baseUrl: currentEnvironment.apiUrl,
    tokenStorage: tokenStorage,
    cryptographyService: cryptographyService,
    errorHandler: ErrorHandlerChainBuilder(),
  );
  final apiAuthenticationProvider = AuthenticationProvider(apiConfig);
  final authenticationRepository = AuthenticationRepository(
    authenticationProvider: apiAuthenticationProvider,
    tokenStorage: tokenStorage,
    secureStorage: secureStorage,
  );

  final independentServicesFuture = Future.wait([
    notificationService.init(),
    OutdatedService.getFormattedAppVersion(),
    SecurityThreathService.init(),
    paymentMethodCacheService.initialize(),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    if (Platform.isAndroid || Platform.isFuchsia) ...[
      FlutterDisplayMode.setHighRefreshRate().catchError((_) => Future.value()),
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersiveSticky,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
      ),
    ],
  ]);

  final storageFuture =
      getOrCreateEncryptionKey(
        secureStorage: secureStorage,
        cryptographyService: cryptographyService,
      ).then((encryptionKey) async {
        return PersistentStorage.initialize(encryptionKey: encryptionKey);
      });

  final results = await Future.wait([independentServicesFuture, storageFuture]);

  final persistentStorage = results[1] as PersistentStorage;

  if (useDeviceLocale) {
    LocaleSettings.useDeviceLocale();
  }

  if (!kIsWeb && Platform.isIOS) {
    await Permission.notification.request();
  }

  final userStorage = UserStorage(
    storage: persistentStorage,
    secureStorage: secureStorage,
  );

  apiConfig.setRefreshTokenSignature(apiAuthenticationProvider.refreshToken);

  const permission = PermissionHelper();

  final userRepository = UserRepository(
    tokenStorage: tokenStorage,
    authenticationProvider: apiAuthenticationProvider,
    userStorage: userStorage,
    permission: permission,
  );
  final apiOtpProvider = OtpProvider(apiConfig);
  final apiHelperProvider = HelperProvider(apiConfig);
  final apiPersonProvider = PersonProvider(apiConfig);
  final apiQrphProvider = QrphProvider(apiConfig);
  final apiTransactionProvider = TransactionProvider(apiConfig);
  final apiWalletProvider = WalletProvider(apiConfig);
  final apiEKycProvider = EKycProvider(apiConfig);
  final apiPayBillsProvider = PayBillsProvider(apiConfig);
  final apiEloadProvider = EloadProvider(apiConfig);
  final notificationInappProvider = NotificationInAppProvider(apiConfig);
  final trustedDeviceProvider = TrustedDeviceProvider(apiConfig);

  final cacheServiceRepository = CacheServiceRepository(
    paymentMethodCacheService: paymentMethodCacheService,
  );
  final notificationRepository = NotificationRepository(
    notificationInAppProvider: notificationInappProvider,
    authenticationProvider: AuthenticationProvider(apiConfig),
  );

  final idMetaApiConfig = IDMETAProviderConfig(
    baseUrl: Env.IDMETA_URL,
    errorHandler: ErrorHandlerChainBuilder(),
  );
  final apiIdmetaProvider = IdmetaProvider(idMetaApiConfig);
  final idMetarepository = IdMetaRepository(
    idMetaProvider: apiIdmetaProvider,
    environment: currentEnvironment.environment,
  );

  final otpRepository = OtpRepository(otpProvider: apiOtpProvider);

  final helperRepository = HelperRepository(
    helperProvider: apiHelperProvider,
    appConfigStorage: appConfigStorage,
  );

  final personRepository = PersonRepository(personProvider: apiPersonProvider);

  final qrphRepository = QrphRepository(qrphProvider: apiQrphProvider);

  final transactionRepository = TransactionRepository(
    transactionProvider: apiTransactionProvider,
  );

  final walletRepository = WalletRepository(walletProvider: apiWalletProvider);

  final ekycRepository = EKycRepository(
    ekycProvider: apiEKycProvider,
    appConfigStorage: appConfigStorage,
  );

  final paybillsRepository = PayBillsRepository(
    paybillsProvider: apiPayBillsProvider,
  );

  final eloadRepository = EloadRepository(eloadProvider: apiEloadProvider);

  final deviceRepository = TrustedDeviceRepository(
    trustedDeviceProvider: trustedDeviceProvider,
  );

  final biometricRepository = BiometricsRepository(
    authProvider: apiAuthenticationProvider,
    secureStorage: secureStorage,
  );

  FlutterNativeSplash.remove();

  runApp(
    AppProviders(
      idMetaRepository: idMetarepository,
      environment: currentEnvironment.environment,
      deviceRepository: deviceRepository,
      paymentMethodCacheService: cacheServiceRepository,
      notificationRepository: notificationRepository,
      authRepository: authenticationRepository,
      userRepository: userRepository,
      otpRepository: otpRepository,
      helperRepository: helperRepository,
      personRepository: personRepository,
      qrphRepository: qrphRepository,
      transactionRepository: transactionRepository,
      eKycRepository: ekycRepository,
      walletRepository: walletRepository,
      paybillsRepository: paybillsRepository,
      //secureTokenStorageRepository: secureTokenStorageRepository,
      eloadRepository: eloadRepository,
      notificationService: notificationService,
      biometricRepository: biometricRepository,
      child: const App(),
    ),
  );
}
