import 'package:busca_via_cep/src/shared/widgets/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({
    Key? key,
    required this.path,
    this.mensage,
  }) : super(key: key);

  final String path;
  final String? mensage;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 250, width: 250, child: Lottie.asset(path)),
          const SizedBox(height: 12),
          Text(mensage ?? '',
              textAlign: TextAlign.center, style: const TextStyle(fontSize: 16))
        ],
      ),
    );
  }
}
