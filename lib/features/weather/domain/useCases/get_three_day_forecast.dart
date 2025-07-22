import 'package:weather/features/weather/data/repository/weather_repository.dart';

import '../entities/weather_entity.dart';

class GetThreeDayForecast {
  final WeatherRepository repository;
  GetThreeDayForecast(this.repository);

  Future<List<WeatherEntity>> call(String location) async {
    return await repository.getThreeDayForecast(location);
  }
}