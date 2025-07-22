import 'package:weather/features/weather/data/repository/weather_repository.dart';

import '../../domain/entities/weather_entity.dart';
import '../datasource/weather_remote_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<WeatherEntity>> getThreeDayForecast(String location) async {
    final models = await remoteDataSource.getThreeDayForecast(location);
    return models.map((model) => WeatherEntity(
      date: model.date,
      minTemp: model.minTemp,
      maxTemp: model.maxTemp,
      avgTemp: model.avgTemp,
    )).toList();
  }
}
