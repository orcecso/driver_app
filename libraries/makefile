generate:
	cd core && flutter pub get && \
	dart run slang && \
	dart pub global activate flutter_gen && \
	cd ../data && flutter pub get && \
	dart run build_runner clean && \
	dart run build_runner build --delete-conflicting-outputs && \
	cd ../domain && flutter pub get && \
	dart run build_runner clean && \
	dart run build_runner build --delete-conflicting-outputs


generate-pwshell:
	
	cd core && flutter pub get && \
	dart run slang && \
	dart pub global activate flutter_gen && \
	cd ../data && flutter pub get && \
	dart run build_runner clean && \
	dart run build_runner buidtold --delete-conflicting-outputs && \
	cd ../domain && flutter pub get && \
	dart run build_runner clean && \
	dart run build_runner build --delete-conflicting-outputs