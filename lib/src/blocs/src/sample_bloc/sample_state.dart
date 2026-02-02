part of 'app_bloc.dart';

enum AppStatus {
  onboardingRequired(),
  authenticated(),
  unauthenticated(),
  unauthenticatedOldUser(),
  unauthenticatedOldUserWithPassword(),
  retryMpin(),
  sessionTimeOut(),
  ekycRequired(),
  underMaintenance(),
  unAuthorizedDevice();

  bool get isLoggedIn => this == AppStatus.authenticated;
  bool get isRetryMpin => this == AppStatus.retryMpin;
  bool get isSessionTimeOut => this == AppStatus.sessionTimeOut;

  bool get isUnauthorized => this == AppStatus.unAuthorizedDevice;
}

enum PermissionStatus {
  initial(),
  loading(),
  permissionDenied(),
  permissionGranted();

  bool get isInitial => this == PermissionStatus.initial;
  bool get isLoading => this == PermissionStatus.loading;
  bool get isPermissionDenied => this == PermissionStatus.permissionDenied;
  bool get isPermissionGranted => this == PermissionStatus.permissionGranted;
}

class AppState extends Equatable {
  const AppState({
    this.status = AppStatus.unauthenticated,
    this.permissionStatus = PermissionStatus.initial,
    this.recentUserMobileNumber,
    this.isCameraEnabled,
    this.isStorageEnabled,
    this.isContactEnabled,
    this.serverStatus = ServerStatus.online,
    this.shouldInitiateBiometrics = true,
    this.redirectToLoginOption = false,
    this.redirectToMpin = false,
  });

  const AppState.permissiondenied()
    : this(permissionStatus: PermissionStatus.permissionDenied);

  const AppState.permissionGranted()
    : this(permissionStatus: PermissionStatus.permissionGranted);

  const AppState.initialPermission()
    : this(permissionStatus: PermissionStatus.initial);

  const AppState.loading() : this(permissionStatus: PermissionStatus.loading);

  const AppState.unAuthorizedDevice()
    : this(status: AppStatus.unAuthorizedDevice);

  const AppState.retryMpin() : this(status: AppStatus.retryMpin);
  const AppState.authenticated() : this(status: AppStatus.authenticated);

  const AppState.unauthenticatedOldUserWithPassword()
    : this(status: AppStatus.unauthenticatedOldUserWithPassword);

  const AppState.onboardingRequired()
    : this(status: AppStatus.onboardingRequired);

  const AppState.unauthenticated() : this(status: AppStatus.unauthenticated);

  const AppState.unauthenticatedOldUser()
    : this(
        status: AppStatus.unauthenticatedOldUser,
        shouldInitiateBiometrics: true,
      );

  const AppState.sessionTimeOut() : this(status: AppStatus.sessionTimeOut);
  final ServerStatus serverStatus;
  final AppStatus status;
  final PermissionStatus permissionStatus;
  final String? recentUserMobileNumber;
  final bool? isCameraEnabled;
  final bool? isStorageEnabled;
  final bool? isContactEnabled;
  final bool shouldInitiateBiometrics;
  final bool redirectToLoginOption;
  final bool redirectToMpin;

  @override
  List<Object?> get props => [
    status,
    permissionStatus,
    recentUserMobileNumber,
    isCameraEnabled,
    isStorageEnabled,
    isContactEnabled,
    shouldInitiateBiometrics,
    serverStatus,
  ];

  AppState copyWith({
    AppStatus? status,
    PermissionStatus? permissionStatus,
    String? recentUserMobileNumber,
    ServerStatus? serverStatus,
    bool? isCameraEnabled,
    bool? isStorageEnabled,
    bool? isContactEnabled,
    bool? isFromLoginPassword,
    bool? shouldInitiateBiometrics,
    bool? redirectToLoginOption,
    bool? redirectToMpin,
  }) {
    return AppState(
      serverStatus: serverStatus ?? this.serverStatus,
      permissionStatus: permissionStatus ?? this.permissionStatus,
      status: status ?? this.status,
      recentUserMobileNumber:
          recentUserMobileNumber ?? this.recentUserMobileNumber,
      isCameraEnabled: isCameraEnabled ?? this.isCameraEnabled,
      isStorageEnabled: isStorageEnabled ?? this.isStorageEnabled,
      isContactEnabled: isContactEnabled ?? this.isContactEnabled,
      shouldInitiateBiometrics:
          shouldInitiateBiometrics ?? this.shouldInitiateBiometrics,
      redirectToLoginOption:
          redirectToLoginOption ?? this.redirectToLoginOption,
      redirectToMpin: redirectToMpin ?? this.redirectToMpin,
    );
  }
}
