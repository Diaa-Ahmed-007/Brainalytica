import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: PredictStroke()));
}

class PredictStroke extends StatefulWidget {
  const PredictStroke({super.key});

  @override
  State<PredictStroke> createState() => _PredictStrokeState();
}

class _PredictStrokeState extends State<PredictStroke> {
  String result = "";
  final Dio _dio = Dio();

  Future<void> predictStroke() async {
    final url = "https://fd95-34-44-206-46.ngrok-free.app/predict/";
    final body = {
      "gender": "male",
      "age": 30,
      "hypertension": "Yes",
      "heart_disease": "no",
      "ever_married": "yEs",
      "work_type": "private",
      "Residence_type": "Urban",
      "avg_glucose_level": 100,
      "bmi": 40,
      "smoking_status": "smokes"
    };

    try {
      final response = await _dio.post(
        url,
        data: jsonEncode(body),
        options: Options(
          headers: {"Content-Type": "application/json"},
          followRedirects: false,
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        setState(() {
          result =
              "✅ Prediction: ${data["prediction"]}, Probability: ${data["probability"]}";
        });
      } else if (response.statusCode == 307) {
        final redirectUrl = response.headers.map['location']?.first;
        if (redirectUrl != null) {
          final redirectedResponse = await _dio.post(
            redirectUrl,
            data: jsonEncode(body),
            options: Options(headers: {"Content-Type": "application/json"}),
          );
          final data = redirectedResponse.data;
          setState(() {
            result =
                "✅ Redirected: ${data["prediction"]}, Probability: ${data["probability"]}";
          });
        } else {
          setState(() {
            result = "❌ Redirected but no Location header found.";
          });
        }
      } else {
        setState(() {
          result = "❌ Failed with status ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "❌ Exception: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stroke Prediction")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: predictStroke,
                child: const Text("Predict"),
              ),
              const SizedBox(height: 20),
              Text(result, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
