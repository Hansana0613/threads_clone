import 'package:flutter/material.dart';

class TextInputFeild extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType inputKeyboardType;
  final String hintText;

  const TextInputFeild({
    Key? key,
    required this.controller,
    required this.isPassword,
    required this.inputKeyboardType,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //input styles

    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      obscureText: isPassword,
      keyboardType: inputKeyboardType,
    );
  }
}
