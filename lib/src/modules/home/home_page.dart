import 'package:busca_via_cep/src/modules/home/home_controller.dart';
import 'package:busca_via_cep/src/shared/abstracts/lottie_paths.dart';
import 'package:busca_via_cep/src/shared/failures/failure.dart';
import 'package:busca_via_cep/src/shared/models/via_cep_model.dart';
import 'package:busca_via_cep/src/shared/widgets/card_via_cep.dart';
import 'package:busca_via_cep/src/shared/widgets/custom_buttom.dart';
import 'package:busca_via_cep/src/shared/widgets/lottie_widget.dart';
import 'package:busca_via_cep/src/shared/widgets/text_form_field_via_cep.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Modular.get<HomeController>();
  final TextEditingController _controllerViaCEP = TextEditingController();

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.transparent,
          toolbarOpacity: 0,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Obx(() => TextFormFieldViaCep(
                  controller: _controllerViaCEP,
                  onChanged: _controller.onChangeTextViaCEP,
                  errorText: _controller.errorTextViaCep,
                )),
            Obx(() => _handlerContent(
                  _controller.viaCepModel,
                  _controller.failure,
                  _controller.loading,
                  _controller.isConnected,
                )),
            Obx(() =>
                _controller.errorTextViaCep == null && _controller.isConnected
                    ? CustomButtom(
                        label: 'Buscar',
                        inLoading: _controller.loading,
                        onTap: () =>
                            _controller.fetchCepInfo(_controllerViaCEP.text),
                      )
                    : const SizedBox(height: 50))
          ],
        ));
  }
}

Widget _handlerContent(ViaCEPModel? viaCEPModel, Failure? failure, bool loading,
    bool isConnected) {
  if (!isConnected) {
    return const LottieWidget(
      path: LottiePaths.noConnection,
      mensage: 'Sem conexão',
    );
  } else if (failure != null) {
    return const LottieWidget(
      path: LottiePaths.error,
      mensage: 'Ocorreu um erro ao buscar informações',
    );
  } else if (loading) {
    return const LottieWidget(path: LottiePaths.loading);
  } else if (viaCEPModel != null) {
    return CardViaCEP(viaCepModel: viaCEPModel);
  } else {
    return const LottieWidget(path: LottiePaths.location);
  }
}
