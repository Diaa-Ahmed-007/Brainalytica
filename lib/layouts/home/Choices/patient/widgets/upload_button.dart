import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({
    super.key,
    required this.height,
    required this.width,
    required this.onTap,
    required this.title,
  });

  final double height;
  final double width;
  final void Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 32,
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w400),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: height * 0.13,
            width: width * 0.32,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Icon(Icons.upload_file_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: height * 0.06),
            ),
          ),
        ),
      ],
    );
  }
}
