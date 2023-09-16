// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forcasted_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForcastedWeatherModel _$ForcastedWeatherModelFromJson(
        Map<String, dynamic> json) =>
    ForcastedWeatherModel(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForcastedWeatherModelToJson(
        ForcastedWeatherModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };
