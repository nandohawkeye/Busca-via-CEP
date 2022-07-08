import 'package:flutter/material.dart';

class TextFormFieldViaCep extends StatelessWidget {
  const TextFormFieldViaCep(
      {Key? key, required this.controller, this.onChanged, this.errorText})
      : super(key: key);

  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder _border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 2, color: Colors.grey));

    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(fontSize: 16),
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        maxLength: 8,
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          errorText: errorText,
          errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
          prefixIcon: const Icon(Icons.search, size: 24),
          hintText: 'Digite o CEP',
          hintStyle: const TextStyle(fontSize: 16),
          isDense: true,
          errorBorder: _border,
          disabledBorder: _border,
          enabledBorder: _border,
          border: _border,
        ),
      ),
    );
  }
}
