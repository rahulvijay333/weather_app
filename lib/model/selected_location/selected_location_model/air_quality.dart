import 'package:json_annotation/json_annotation.dart';

part 'air_quality.g.dart';

@JsonSerializable()
class AirQuality {
  double? co;
  double? no2;
  double? o3;
  double? so2;
  @JsonKey(name: 'pm2_5')
  double? pm25;
  double? pm10;
  @JsonKey(name: 'us-epa-index')
  int? usEpaIndex;
  @JsonKey(name: 'gb-defra-index')
  int? gbDefraIndex;

  AirQuality({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
    this.gbDefraIndex,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return _$AirQualityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AirQualityToJson(this);
}
