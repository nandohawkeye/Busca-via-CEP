import 'package:busca_via_cep/src/shared/abstracts/i_client_http.dart';
import 'package:busca_via_cep/src/shared/constants/via_cep_constants.dart';
import 'package:busca_via_cep/src/shared/failures/failure.dart';
import 'package:busca_via_cep/src/shared/models/via_cep_model.dart';
import 'package:dartz/dartz.dart';

class HomeService {
  HomeService(this._client);

  final IClientHTTP _client;

  Future<Either<Failure, ViaCEPModel>> getInfosCEP(String cep) async {
    return await _client.get(url: '${ViaCEPConstants.url}$cep/json/').then(
        (value) => value.fold((failure) => left(failure),
            (data) => right(ViaCEPModel.fronJson(data))));
  }
}
