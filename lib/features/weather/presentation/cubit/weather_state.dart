import 'package:weather/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<WeatherEntity> forecast;
  WeatherLoaded(this.forecast);
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}
