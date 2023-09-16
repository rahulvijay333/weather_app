class CurrentWeatherModel {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String localtime;
  final Condition currentCondition;
  final String lastUpdated;
  final double tempC;
  final double windKph;
  final int humidity;
  final String windDirection;
  final double precip;

  CurrentWeatherModel({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localtime,
    required this.currentCondition,
    required this.lastUpdated,
    required this.tempC,
    required this.windKph,
    required this.humidity,
    required this.windDirection,
    required this.precip,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      name: json['location']['name'],
      region: json['location']['region'],
      country: json['location']['country'],
      lat: json['location']['lat'].toDouble(),
      lon: json['location']['lon'].toDouble(),
      localtime: json['location']['localtime'],
      currentCondition: Condition.fromJson(json['current']['condition']),
      lastUpdated: json['current']['last_updated'],
      tempC: json['current']['temp_c'].toDouble(),
      windKph: json['current']['wind_kph'].toDouble(),
      humidity: json['current']['humidity'],
      windDirection: json['current']['wind_dir'],
      precip: json['current']['precip_mm'].toDouble(),
    );
  }
}

class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}
