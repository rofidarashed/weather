import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AIModelService {
  final Dio _dio = Dio();

  Future<int?> getPrediction(List<int> features) async {
    try {
      final response = await _dio.post(
        'http://52.58.170.254:5000/predict',
        data: {'features': features},
      );
      return response.data['prediction'];
    } catch (e) {
      debugPrint('AI prediction error: $e');
      return null;
    }
  }
}
