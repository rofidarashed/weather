class WeatherModel {
  final String? date;
  final double? minTemp;
  final double? maxTemp;
  final double? avgTemp;
  final String condition;
  final double temperature;
  final int humidity;

  WeatherModel({
    required this.condition,
    required this.temperature,
    required this.humidity,
    this.date,
    this.minTemp,
    this.maxTemp,
    this.avgTemp,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    print("WeatherModel.fromJson json: ${json.keys}");
    print("WeatherModel.fromJson day: ${json['day'].keys}");
    print("WeatherModel.fromJson current: ${json['current']}");
    return WeatherModel(
      date: json['date'],
      minTemp: json['day']['mintemp_c'].toDouble()??0,
      maxTemp: json['day']['maxtemp_c'].toDouble()??0 ,
      avgTemp: json['day']['avgtemp_c'].toDouble()??0,
      condition: json["current"]["condition"]["text"],
      temperature: json['current']['temp_c'].toDouble()??0,
      humidity: json['current']['humidity'],
    );
  }
  List<int> toAiFeatures() {
    final isRainy = condition.toLowerCase().contains('rain') ? 1 : 0;
    final isSunny = condition.toLowerCase().contains('sun') ? 1 : 0;

    final isHot = temperature >= 30 ? 1 : 0;
    final isMild = temperature >= 20 && temperature < 30 ? 1 : 0;

    final isNormalHumidity = humidity >= 40 && humidity <= 70 ? 1 : 0;

    return [isRainy, isSunny, isHot, isMild, isNormalHumidity];
  }
}
