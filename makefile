# Makefile for traxionPay

# Clean Flutter project and fetch dependencies

# Run sits

clean:
	flutter clean
	flutter pub get
	fluttergen -c ./pubspec.yaml
	
assets:
	flutter pub get
	dart run slang
	dart run build_runner clean
	dart run build_runner build --delete-conflicting-outputs
	dart run flutter_native_splash:create --path=./flutter_native_splash.yaml
	dart run flutter_launcher_icons
	dart pub global activate flutter_gen
	fluttergen -c ./pubspec.yaml
	
rename:
	dart run package_rename

build_test:
	flutter clean
	flutter pub get
	flutter build appbundle --release 
	flutter build ipa --release 

build_android:
	flutter clean
	flutter pub get
	flutter build apk --release 

build_dev:
	flutter clean
	flutter pub get
	fvm flutter build apk --release -t lib/main_dev.dart
	fvm flutter build ipa --release -t lib/main_dev.dart

# Single non-production build that handles DEV, SIT, UAT switching
build_staging:
	flutter clean
	flutter pub get
	fvm flutter build apk --release -t lib/main.dart --obfuscate --split-debug-info=build/app/outputs/symbols 
	fvm flutter build ipa --release -t lib/main.dart --obfuscate --split-debug-info=build/app/outputs/symbols 
	


# Separate production build (no environment switching)
build_prod:
	flutter clean
	flutter pub get
	fvm flutter build appbundle --release -t lib/main_prod.dart --obfuscate --split-debug-info=build/app/outputs/symbols 
	fvm flutter build apk --release -t lib/main_prod.dart --obfuscate --split-debug-info=build/app/outputs/symbols 
	fvm flutter build ipa --release -t lib/main_prod.dart --obfuscate --split-debug-info=build/app/outputs/symbols 

build_sit:
	flutter clean
	flutter pub get
	fvm flutter build apk --release -t lib/main_sit.dart --obfuscate --split-debug-info=build/app/outputs/symbols
	fvm flutter build ipa --release -t lib/main_sit.dart --obfuscate --split-debug-info=build/app/outputs/symbols

build_uat:
	flutter clean
	flutter pub get
	fvm flutter build apk --release -t lib/main_uat.dart --obfuscate --split-debug-info=build/app/outputs/symbols
	fvm flutter build ipa --release -t lib/main_uat.dart --obfuscate --split-debug-info=build/app/outputs/symbols

build_prod3:
	flutter clean
	flutter pub get
	fvm flutter build appbundle --release -t lib/main_prod.dart --obfuscate --split-debug-info=build/app/outputs/symbols 
	fvm flutter build apk --release -t lib/main_prod.dart --obfuscate --split-debug-info=build/app/outputs/symbols 
	fvm flutter build ipa --release -t lib/main_prod.dart --obfuscate --split-debug-info=build/app/outputs/symbols 

build_prod2:
	flutter clean
	flutter pub get
	fvm flutter build apk --release -t lib/main_prod.dart --obfuscate --split-debug-info=build/app/outputs/symbols
	fvm flutter build ipa --release -t lib/main_prod.dart --obfuscate --split-debug-info=build/app/outputs/symbols

build_web_sit:
	flutter build web --release --target=lib/main_sit.dart 
	firebase deploy --only hosting

build_apk:
	flutter clean
	flutter pub get
	fvm flutter build apk --release -t lib/main_sit.dart