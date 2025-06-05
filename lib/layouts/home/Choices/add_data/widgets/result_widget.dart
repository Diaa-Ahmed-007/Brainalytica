import 'package:flutter/material.dart';

class ResultsWidget extends StatelessWidget {
  const ResultsWidget({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    required this.result,
  });

  final double height;
  final double width;
  final String title;
  final String result;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 32,
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: height * 0.08,
            width: width * 0.8,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              result,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.04,
        ),
      ],
    );
  }
}
