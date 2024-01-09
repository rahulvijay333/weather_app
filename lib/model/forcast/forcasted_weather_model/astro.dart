import 'package:json_annotation/json_annotation.dart';

part 'astro.g.dart';

@JsonSerializable()
class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  @JsonKey(name: 'moon_phase')
  String? moonPhase;
  @JsonKey(name: 'moon_illumination')
  int? moonIllumination;
  @JsonKey(name: 'is_moon_up')
  int? isMoonUp;
  @JsonKey(name: 'is_sun_up')
  int? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);

  Map<String, dynamic> toJson() => _$AstroToJson(this);
}
