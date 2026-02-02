# Makefile 

# Clean Flutter project and fetch dependencies

generate:
	flutter clean
	flutter pub get
	flutter pub run build_runner clean
	flutter pub run build_runner build --delete-conflicting-outputs
	