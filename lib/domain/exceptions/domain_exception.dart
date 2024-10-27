class DomainException implements Exception {
  final String? error;

  const DomainException({
    this.error,
  });

  // ignore: annotate_overrides
  String toString() => '${error.toString()}: $error';
}
