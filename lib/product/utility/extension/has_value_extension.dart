/// [HasValueExtension] is a extension class to check the value is null or not.
extension HasValueExtension on Object? {
  /// [hasValue] is a method to check the value is null or not.
  bool get hasValue {
    if (this == null) return false;

    if (this is String) return (this! as String).trim().isNotEmpty;
    if (this is List) return (this! as List).isNotEmpty;
    if (this is Map) return (this! as Map).isNotEmpty;

    return true;
  }
}
