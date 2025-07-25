import 'package:weather/features/weather/data/model/weather_model.dart';
import 'package:weather/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<WeatherEntity> forecast;
  final WeatherModel? currentWeather;
  final int? aiPrediction;

  WeatherLoaded({
    required this.forecast,
    this.currentWeather,
    this.aiPrediction,
  });

  WeatherLoaded copyWith({
    List<WeatherEntity>? forecast,
    WeatherModel? currentWeather,
    int? aiPrediction,
  }) {
    return WeatherLoaded(
      forecast: forecast ?? this.forecast,
      currentWeather: currentWeather ?? this.currentWeather,
      aiPrediction: aiPrediction ?? this.aiPrediction,
    );
  }
}

class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}
