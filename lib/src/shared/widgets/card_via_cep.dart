import 'package:busca_via_cep/src/shared/abstracts/lottie_paths.dart';
import 'package:busca_via_cep/src/shared/models/via_cep_model.dart';
import 'package:busca_via_cep/src/shared/widgets/fade_animation.dart';
import 'package:busca_via_cep/src/shared/widgets/lottie_widget.dart';
import 'package:flutter/material.dart';

class CardViaCEP extends StatelessWidget {
  const CardViaCEP({Key? key, required this.viaCepModel}) : super(key: key);

  final ViaCEPModel viaCepModel;

  @override
  Widget build(BuildContext context) {
    final bool viaCEPisEmpty = viaCepModel.logradouro == null &&
        viaCepModel.bairro == null &&
        viaCepModel.complemento == null &&
        viaCepModel.localidade == null &&
        viaCepModel.uf == null &&
        viaCepModel.cep == null &&
        viaCepModel.ddd == null;

    return FadeAnimation(
      child: viaCEPisEmpty
          ? const LottieWidget(
              path: LottiePaths.empty,
              mensage: 'Nenhuma informação encontrada',
            )
          : Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38.withOpacity(0.15),
                        blurRadius: 30,
                        offset: const Offset(0, 15))
                  ]),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _LabelItem(
                      label: 'Logradouro', value: viaCepModel.logradouro),
                  _LabelItem(label: 'Bairro', value: viaCepModel.bairro),
                  _LabelItem(
                      label: 'Complemento', value: viaCepModel.complemento),
                  _LabelItem(
                      label: 'Localidade', value: viaCepModel.localidade),
                  _LabelItem(label: 'UF', value: viaCepModel.uf),
                  _LabelItem(label: 'CEP', value: viaCepModel.cep),
                  _LabelItem(label: 'DDD', value: viaCepModel.ddd),
                ],
              )),
    );
  }
}

class _LabelItem extends StatelessWidget {
  const _LabelItem({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return value == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: RichText(
              text: TextSpan(
                  text: '$label: ',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 16),
                  children: [
                    TextSpan(
                      text: value,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                          fontSize: 16),
                    )
                  ]),
            ),
          );
  }
}
