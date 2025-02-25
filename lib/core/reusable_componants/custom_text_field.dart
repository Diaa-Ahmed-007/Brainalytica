import 'package:flutter/material.dart';

typedef ValidationFieled = String? Function(String?)?;

// ignore: must_be_immutable
class CustomTextFiled extends StatelessWidget {
  String hintText;
  TextInputType keyboard;
  TextEditingController textController;
  bool? obscureText;
  Widget? suffixIcon;
  ValidationFieled validator;
  Color? fillColor;
  CustomTextFiled({
    super.key,
    required this.hintText,
    required this.keyboard,
    required this.textController,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Colors.black45, fontSize: 20, fontWeight: FontWeight.w600),
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? Theme.of(context).colorScheme.onPrimary,
        filled: true,
        disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 1, color: Colors.white)),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 1, color: Colors.white)),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 1, color: Colors.white)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(width: 1, color: Colors.white)),
      ),
      style: const TextStyle(),
      keyboardType: keyboard,
      controller: textController,
      obscureText: obscureText ?? false,
      obscuringCharacter: "*",
      validator: validator,
    );
  }
}
