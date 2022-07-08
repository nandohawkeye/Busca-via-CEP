class Failure {
  Failure({required this.mensage, this.stackTrace});

  final String mensage;
  final String? stackTrace;

  @override
  String toString() => stackTrace != null
      ? 'Mensage: $mensage'
          '\n ------------------------- \n'
          'StackTrace: $stackTrace'
      : 'Mensage: $mensage';
}
