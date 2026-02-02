# Makefile 

# Clean Flutter project and fetch dependencies

generate:
	flutter clean
	flutter pub get
	dart run slang
	dart pub global activate flutter_gen
	fluttergen -c ./pubspec.yaml
