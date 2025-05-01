import 'package:flutter/material.dart';
import 'package:threads_clone/utils/colors.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SubmitButton({Key? key, required this.text, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        alignment: Alignment.center,
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          color: mainYellowColor,
        ),
        child: TextButton(
          onPressed: onPressed,
          style: const ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.black),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
