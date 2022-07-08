// ignore_for_file: empty_constructor_bodies

import 'package:busca_via_cep/src/shared/abstracts/i_model.dart';

class ViaCEPModel implements IModel {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? ddd;

  ViaCEPModel.fronJson(Map<String, dynamic> data) {
    cep = data['cep'];
    logradouro = data['logradouro'];
    complemento = data['complemento'];
    bairro = data['bairro'];
    localidade = data['localidade'];
    uf = data['uf'];
    ibge = data['ibge'];
    ddd = data['ddd'];
  }

  ViaCEPModel.none();
}
