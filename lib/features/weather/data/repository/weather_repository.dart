
import 'package:weather/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<List<WeatherEntity>> getThreeDayForecast(String location);
}