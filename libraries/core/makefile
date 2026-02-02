# Makefile 

# Clean Flutter project and fetch dependencies

generate:
	flutter clean
	flutter pub get
	flutter pub run slang
	flutter pub pub global activate flutter_gen
	fluttergen -c ./pubspec.yaml
