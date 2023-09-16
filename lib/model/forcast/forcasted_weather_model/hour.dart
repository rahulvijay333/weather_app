import 'package:json_annotation/json_annotation.dart';

import 'condition.dart';

part 'hour.g.dart';

@JsonSerializable()
class Hour {
  @JsonKey(name: 'time_epoch')
  double? timeEpoch;
  String? time;
  @JsonKey(name: 'temp_c')
  double? tempC;
  @JsonKey(name: 'temp_f')
  double? tempF;
  @JsonKey(name: 'is_day')
  double? isDay;
  Condition? condition;
  @JsonKey(name: 'wind_mph')
  double? windMph;
  @JsonKey(name: 'wind_kph')
  double? windKph;
  @JsonKey(name: 'wind_degree')
  double? windDegree;
  @JsonKey(name: 'wind_dir')
  String? windDir;
  @JsonKey(name: 'pressure_mb')
  double? pressureMb;
  @JsonKey(name: 'pressure_in')
  double? pressureIn;
  @JsonKey(name: 'precip_mm')
  double? precipMm;
  @JsonKey(name: 'precip_in')
  double? precipIn;
  double? humidity;
  double? cloud;
  @JsonKey(name: 'feelslike_c')
  double? feelslikeC;
  @JsonKey(name: 'feelslike_f')
  double? feelslikeF;
  @JsonKey(name: 'windchill_c')
  double? windchillC;
  @JsonKey(name: 'windchill_f')
  double? windchillF;
  @JsonKey(name: 'heatindex_c')
  double? heatindexC;
  @JsonKey(name: 'heatindex_f')
  double? heatindexF;
  @JsonKey(name: 'dewpoint_c')
  double? dewpointC;
  @JsonKey(name: 'dewpoint_f')
  double? dewpointF;
  @JsonKey(name: 'will_it_rain')
  double? willItRain;
  @JsonKey(name: 'chance_of_rain')
  double? chanceOfRain;
  @JsonKey(name: 'will_it_snow')
  double? willItSnow;
  @JsonKey(name: 'chance_of_snow')
  double? chanceOfSnow;
  @JsonKey(name: 'vis_km')
  double? visKm;
  @JsonKey(name: 'vis_miles')
  double? visMiles;
  @JsonKey(name: 'gust_mph')
  double? gustMph;
  @JsonKey(name: 'gust_kph')
  double? gustKph;
  double? uv;

  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);
}
