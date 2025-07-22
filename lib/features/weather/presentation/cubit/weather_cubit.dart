import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/data/datasource/weather_remote_datasource.dart';
import 'package:weather/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather/features/weather/domain/useCases/get_three_day_forecast.dart';
import 'package:weather/features/weather/presentation/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  void fetchWeather() async {
    emit(WeatherLoading());
    try {
      final repository = WeatherRepositoryImpl(WeatherRemoteDataSource());
      final usecase = GetThreeDayForecast(repository);
      final weather = await usecase("Cairo");
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}