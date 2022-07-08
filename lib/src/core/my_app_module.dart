import 'package:busca_via_cep/src/modules/home/home_controller.dart';
import 'package:busca_via_cep/src/modules/home/home_page.dart';
import 'package:busca_via_cep/src/modules/home/services/home_service.dart';
import 'package:busca_via_cep/src/modules/home/services/connectivity_service.dart';
import 'package:busca_via_cep/src/shared/services/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyAppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController(i(), i())),
        Bind.factory((i) => HomeService(i())),
        Bind.factory((i) => DioClient(i())),
        Bind.singleton((i) => ConnectivyService()),
        Bind.factory((i) => Dio())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
      ];
}
