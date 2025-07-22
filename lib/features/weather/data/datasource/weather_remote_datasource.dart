import 'package:dio/dio.dart';
import '../model/weather_model.dart';

class WeatherRemoteDataSource {
  final Dio _dio = Dio();
  final String _apiKey = '61a5f462b13f4103af695514252207';

  Future<List<WeatherModel>> getThreeDayForecast(String location) async {
    try {
      final response = await _dio.get(
        'https://api.weatherapi.com/v1/forecast.json',
        queryParameters: {
          'key': _apiKey,
          'q': location,
          'days': 3,
        },
      );

      final List forecast = response.data['forecast']['forecastday'];
      return forecast.map((e) => WeatherModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch weather: $e');
    }
  }
}