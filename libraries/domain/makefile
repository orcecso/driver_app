# Makefile

# Clean Flutter project and fetch dependencies

generate:
	flutter clean
	flutter pub get
	dart run build_runner clean
	dart run build_runner build --delete-conflicting-outputs
