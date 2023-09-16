import 'package:json_annotation/json_annotation.dart';

import 'condition.dart';

part 'day.g.dart';

@JsonSerializable()
class Day {
  @JsonKey(name: 'maxtemp_c')
  double? maxtempC;
  @JsonKey(name: 'maxtemp_f')
  double? maxtempF;
  @JsonKey(name: 'mintemp_c')
  double? mintempC;
  @JsonKey(name: 'mintemp_f')
  double? mintempF;
  @JsonKey(name: 'avgtemp_c')
  double? avgtempC;
  @JsonKey(name: 'avgtemp_f')
  double? avgtempF;
  @JsonKey(name: 'maxwind_mph')
  double? maxwindMph;
  @JsonKey(name: 'maxwind_kph')
  double? maxwindKph;
  @JsonKey(name: 'totalprecip_mm')
  double? totalprecipMm;
  @JsonKey(name: 'totalprecip_in')
  double? totalprecipIn;
  @JsonKey(name: 'totalsnow_cm')
  double? totalsnowCm;
  @JsonKey(name: 'avgvis_km')
  double? avgvisKm;
  @JsonKey(name: 'avgvis_miles')
  double? avgvisMiles;
  double? avghumidity;
  @JsonKey(name: 'daily_will_it_rain')
  int? dailyWillItRain;
  @JsonKey(name: 'daily_chance_of_rain')
  int? dailyChanceOfRain;
  @JsonKey(name: 'daily_will_it_snow')
  int? dailyWillItSnow;
  @JsonKey(name: 'daily_chance_of_snow')
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
