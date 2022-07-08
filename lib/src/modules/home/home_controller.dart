import 'dart:async';

import 'package:busca_via_cep/src/modules/home/services/home_service.dart';
import 'package:busca_via_cep/src/modules/home/services/connectivity_service.dart';
import 'package:busca_via_cep/src/shared/failures/failure.dart';
import 'package:busca_via_cep/src/shared/models/via_cep_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this._service, this._serviceConnectivity)
      : _isConnected = Rx<bool>(_serviceConnectivity.isConnect);

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  final HomeService _service;
  final ConnectivyService _serviceConnectivity;

  final Rx<Failure?> _failure = Rx<Failure?>(null);

  final Rx<bool> _isConnected;
  bool get isConnected => _isConnected.value;

  Failure? get failure => _failure.value;

  final Rx<bool> _loading = Rx<bool>(false);
  bool get loading => _loading.value;

  final Rx<ViaCEPModel?> _viaCepModel = Rx<ViaCEPModel?>(null);
  ViaCEPModel? get viaCepModel => _viaCepModel.value;

  final Rx<String?> _errorTextViaCep = Rx<String?>('');
  String? get errorTextViaCep => _errorTextViaCep.value;

  void onChangeTextViaCEP(String value) {
    if (value.length == 8) {
      _errorTextViaCep.value = null;
    } else {
      _errorTextViaCep.value = 'CEP incompleto';
    }
  }

  Future<void> fetchCepInfo(String url) async {
    _failure.value = null;
    _loading.value = true;
    await _service.getInfosCEP(url).then((result) => result.fold(
        (failure) => _failure.value = failure,
        (data) => _viaCepModel.value = data));
    _loading.value = false;
  }

  init() async {
    _connectivitySubscription =
        _serviceConnectivity.streamConnectivy.listen((event) {
      if (event == ConnectivityResult.none) {
        _isConnected.value = false;
      } else {
        _isConnected.value = true;
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
