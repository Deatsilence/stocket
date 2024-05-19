/// [IterableExtension] extension method for safe iterable
extension IterableExtension<T> on Iterable<T?> {
  /// [makeSafeCustom] method for safe iterable
  List<T> makeSafeCustom(bool Function(T? value) onHandle) =>
      where(onHandle).cast<T>().toList();
}
