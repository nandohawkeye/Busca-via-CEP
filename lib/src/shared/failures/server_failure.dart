import 'package:busca_via_cep/src/shared/failures/failure.dart';

class ServerFailure extends Failure {
  ServerFailure({String mensage = 'An error has occurred', String? stackTrace})
      : super(mensage: mensage, stackTrace: stackTrace);
}
