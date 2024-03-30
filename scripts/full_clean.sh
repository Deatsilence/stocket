flutter clean; flutter pub get; rm pubspec.lock; cd ios; pod deintegrate; pod install; cd ..;
cd modules;
cd gen; flutter clean; rm pubspec.lock; flutter pub get; cd ..;
cd common; flutter clean; rm pubspec.lock; flutter pub get; cd ..;
cd ..
flutter pub get;