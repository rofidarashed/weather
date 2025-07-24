import 'package:dio/dio.dart';

class AIModelService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.1.13:5000',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
    ),
  );

  Future<int?> getPrediction(List<int> features) async {
    try {
      final response = await _dio.post(
        '${_dio.options.baseUrl}/predict',
        data: {'features': features},
      );
      return response.data['prediction'];
    } catch (e) {
      print('AI prediction error: $e');
      return null;
    }
  }
}
