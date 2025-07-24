import 'package:weather/features/weather/data/repository/weather_repository.dart';

import '../entities/weather_entity.dart';

class GetSevenDayForecast {
  final WeatherRepository repository;
  GetSevenDayForecast(this.repository);

  Future<List<WeatherEntity>> call(String location) async {
    return await repository.getSevenDayForecast(location);
  }
}
