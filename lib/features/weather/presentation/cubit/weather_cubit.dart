import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/utils/weather_predictor.dart';
import 'package:weather/features/weather/data/datasource/ai_service.dart';
import 'package:weather/features/weather/data/datasource/weather_remote_datasource.dart';
import 'package:weather/features/weather/data/model/weather_model.dart';
import 'package:weather/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather/features/weather/domain/useCases/get_three_day_forecast.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  void fetchWeather() async {
    emit(WeatherLoading());
    try {
      final repository = WeatherRepositoryImpl(WeatherRemoteDataSource());
      final usecase = GetSevenDayForecast(repository);
      final weather = await usecase("Cairo");
      emit(WeatherLoaded(forecast: weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

 void predictFromWeatherData(WeatherModel weather) async {
  if (state is! WeatherLoaded) {
    emit(WeatherError("Can't predict without weather data."));
    return;
  }

  final currentState = state as WeatherLoaded;

  emit(WeatherLoading());
  try {
    final features = mapWeatherDataToAIModel(
      condition: weather.condition,
      tempC: weather.temperature,
      humidity: weather.humidity,
    );

    final prediction = await AIModelService().getPrediction(features);

    emit(
      currentState.copyWith(
        aiPrediction: prediction,
        currentWeather: weather,
      ),
    );
  } catch (e) {
    emit(WeatherError(e.toString()));
  }
}
}
