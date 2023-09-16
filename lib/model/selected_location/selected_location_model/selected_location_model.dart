import 'package:json_annotation/json_annotation.dart';

import 'current.dart';
import 'forecast.dart';
import 'location.dart';

part 'selected_location_model.g.dart';

@JsonSerializable()
class SelectedLocationModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  SelectedLocationModel({this.location, this.current, this.forecast});

  factory SelectedLocationModel.fromJson(Map<String, dynamic> json) {
    return _$SelectedLocationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelectedLocationModelToJson(this);
}
