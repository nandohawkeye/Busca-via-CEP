// ignore_for_file: empty_catches

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivyService extends GetxService {
  final Rx<bool> _isConnect = Rx<bool>(false);
  bool get isConnect => _isConnect.value;

  Stream<ConnectivityResult> get streamConnectivy =>
      Connectivity().onConnectivityChanged;

  @override
  void onInit() async {
    try {
      final result = await Connectivity().checkConnectivity();

      if (result == ConnectivityResult.none) {
        _isConnect.value = false;
      } else {
        _isConnect.value = true;
      }
    } catch (e) {}
    super.onInit();
  }
}
