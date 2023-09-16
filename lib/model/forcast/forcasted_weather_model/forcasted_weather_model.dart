import 'package:json_annotation/json_annotation.dart';

import 'current.dart';
import 'forecast.dart';
import 'location.dart';

part 'forcasted_weather_model.g.dart';

@JsonSerializable()
class ForcastedWeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  ForcastedWeatherModel({this.location, this.current, this.forecast});

  factory ForcastedWeatherModel.fromJson(Map<String, dynamic> json) {
    return _$ForcastedWeatherModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForcastedWeatherModelToJson(this);
}
