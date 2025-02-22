import 'package:flutter/material.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({
    super.key,
    required this.title,
    required this.ontap,
  });
  final String title;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: SizedBox(
        width: double.infinity,
        height: height * 0.07,
        child: FilledButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            overlayColor: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
