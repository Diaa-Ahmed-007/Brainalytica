import 'package:flutter/material.dart';

class UploadButtonsWidget extends StatelessWidget {
  const UploadButtonsWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(title),
      ),
    );
  }
}
