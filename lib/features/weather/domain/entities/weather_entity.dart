class WeatherEntity {
  final String date;
  final double minTemp;
  final double maxTemp;
  final double avgTemp;
  final String condition;
  final int humidity;

  WeatherEntity({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.avgTemp,
    required this.condition,
    required this.humidity,
  });
}
