class DataException implements Exception {
  final String? error;

  const DataException({
    this.error,
  });

  // ignore: annotate_overrides
  String toString() => '${error.toString()}: $error';
}
