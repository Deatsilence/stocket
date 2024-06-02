/// [SharedNotInitializeException] is a class that handle the exception when
/// the shared preferences didn't initialize right now
final class SharedNotInitializeException implements Exception {
  @override
  String toString() {
    return "Your preferences didn't initialize right now ";
  }
}
