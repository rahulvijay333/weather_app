import 'package:json_annotation/json_annotation.dart';

import 'condition.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  @JsonKey(name: 'last_updated_epoch')
  double? lastUpdatedEpoch;
  @JsonKey(name: 'last_updated')
  String? lastUpdated;
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
  @JsonKey(name: 'vis_km')
  double? visKm;
  @JsonKey(name: 'vis_miles')
  double? visMiles;
  double? uv;
  @JsonKey(name: 'gust_mph')
  double? gustMph;
  @JsonKey(name: 'gust_kph')
  double? gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
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
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return _$CurrentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
