import 'package:busca_via_cep/src/shared/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IClientHTTP {
  Future<Either<Failure, dynamic>> get({required String url});
}
