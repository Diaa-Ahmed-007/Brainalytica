import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.ontap,
    this.color,
  });
  final String title;
  final Function() ontap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).colorScheme.primary),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
