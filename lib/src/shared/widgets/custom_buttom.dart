import 'package:busca_via_cep/src/shared/widgets/fade_animation.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {Key? key, required this.label, this.onTap, required this.inLoading})
      : super(key: key);

  final String label;
  final Function()? onTap;
  final bool inLoading;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      child: InkWell(
        onTap: inLoading ? null : onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          child: inLoading
              ? const SizedBox(
                  height: 25,
                  width: 25,
                  child: FadeAnimation(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                    backgroundColor: Colors.transparent,
                  )),
                )
              : FadeAnimation(
                  child: Text(
                    label,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue[900]!.withOpacity(0.35),
                  offset: const Offset(4, 10),
                  blurRadius: 30,
                )
              ]),
        ),
      ),
    );
  }
}
