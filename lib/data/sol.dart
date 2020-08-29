class Sol {
  final int solKey;
  final double avgTemperature;
  final double minTemperature;
  final double maxTemperature;
  final double pressure;
  final String season;
  final double windSpeed;
  final String windDirection;

  // todo: add null safety here
  Sol(int solKey, Map<String, dynamic> json)
      : solKey = solKey,
        avgTemperature = json['$solKey']['AT']['av'] as double,
        minTemperature = json['$solKey']['AT']['mn'] as double,
        maxTemperature = json['$solKey']['AT']['mx'] as double,
        pressure = json['$solKey']['PRE']['av'] as double,
        season = json['$solKey']['Season'] as String ?? '',
        windSpeed = json['$solKey']['HWS']['av'] as double,
        windDirection =
            json['$solKey']['WD']['most_common']['compass.point'] as String ??
                '';

  Sol.empty()
      : solKey = 0,
        avgTemperature = 0,
        minTemperature = 0,
        maxTemperature = 0,
        pressure = 0,
        season = '',
        windSpeed = 0,
        windDirection = '';
}
