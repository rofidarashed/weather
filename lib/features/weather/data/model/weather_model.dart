class WeatherModel {
  final String date;
  final double minTemp;
  final double maxTemp;
  final double avgTemp;

  WeatherModel({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.avgTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      date: json['date'],
      minTemp: json['day']['mintemp_c'].toDouble(),
      maxTemp: json['day']['maxtemp_c'].toDouble(),
      avgTemp: json['day']['avgtemp_c'].toDouble(),
    );
  }
}