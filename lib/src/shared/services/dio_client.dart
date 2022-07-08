import 'package:busca_via_cep/src/shared/abstracts/i_client_http.dart';
import 'package:busca_via_cep/src/shared/failures/server_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:busca_via_cep/src/shared/failures/failure.dart';
import 'package:dio/dio.dart';

class DioClient extends IClientHTTP {
  DioClient(this._client);

  final Dio _client;

  @override
  Future<Either<Failure, dynamic>> get({required String url}) async {
    try {
      final result = await _client.get(url);

      if (result.statusCode == 200) {
        return right(result.data);
      } else {
        return left(ServerFailure());
      }
    } catch (error, st) {
      return left(
          ServerFailure(mensage: error.toString(), stackTrace: st.toString()));
    }
  }
}
