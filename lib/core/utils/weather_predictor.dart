List<int> mapWeatherDataToAIModel({
  required String condition,
  required double tempC,
  required int humidity,
}) {
  int isRainy = condition.toLowerCase().contains('rain') ? 1 : 0;
  int isSunny = condition.toLowerCase().contains('sunny') ? 1 : 0;
  int isHot = tempC >= 30 ? 1 : 0;
  int isMild = tempC >= 20 && tempC < 30 ? 1 : 0;
  int isNormalHumidity = humidity >= 40 && humidity <= 60 ? 1 : 0;

  return [isRainy, isSunny, isHot, isMild, isNormalHumidity];
}
