// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hour _$HourFromJson(Map<String, dynamic> json) => Hour(
      timeEpoch: json['time_epoch'] as int?,
      time: json['time'] as String?,
      tempC: (json['temp_c'] as num?)?.toDouble(),
      tempF: (json['temp_f'] as num?)?.toDouble(),
      isDay: json['is_day'] as int?,
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      windMph: (json['wind_mph'] as num?)?.toDouble(),
      windKph: (json['wind_kph'] as num?)?.toDouble(),
      windDegree: json['wind_degree'] as int?,
      windDir: json['wind_dir'] as String?,
      pressureMb: (json['pressure_mb'] as num?)?.toDouble(),
      pressureIn: (json['pressure_in'] as num?)?.toDouble(),
      precipMm: (json['precip_mm'] as num?)?.toDouble(),
      precipIn: (json['precip_in'] as num?)?.toDouble(),
      humidity: json['humidity'] as int?,
      cloud: json['cloud'] as int?,
      feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
      feelslikeF: (json['feelslike_f'] as num?)?.toDouble(),
      windchillC: (json['windchill_c'] as num?)?.toDouble(),
      windchillF: (json['windchill_f'] as num?)?.toDouble(),
      heatindexC: (json['heatindex_c'] as num?)?.toDouble(),
      heatindexF: (json['heatindex_f'] as num?)?.toDouble(),
      dewpointC: (json['dewpoint_c'] as num?)?.toDouble(),
      dewpointF: (json['dewpoint_f'] as num?)?.toDouble(),
      willItRain: json['will_it_rain'] as int?,
      chanceOfRain: json['chance_of_rain'] as int?,
      willItSnow: json['will_it_snow'] as int?,
      chanceOfSnow: json['chance_of_snow'] as int?,
      visKm: (json['vis_km'] as num?)?.toDouble(),
      visMiles: (json['vis_miles'] as num?)?.toDouble(),
      gustMph: (json['gust_mph'] as num?)?.toDouble(),
      gustKph: (json['gust_kph'] as num?)?.toDouble(),
      uv: (json['uv'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HourToJson(Hour instance) => <String, dynamic>{
      'time_epoch': instance.timeEpoch,
      'time': instance.time,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDir,
      'pressure_mb': instance.pressureMb,
      'pressure_in': instance.pressureIn,
      'precip_mm': instance.precipMm,
      'precip_in': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslikeC,
      'feelslike_f': instance.feelslikeF,
      'windchill_c': instance.windchillC,
      'windchill_f': instance.windchillF,
      'heatindex_c': instance.heatindexC,
      'heatindex_f': instance.heatindexF,
      'dewpoint_c': instance.dewpointC,
      'dewpoint_f': instance.dewpointF,
      'will_it_rain': instance.willItRain,
      'chance_of_rain': instance.chanceOfRain,
      'will_it_snow': instance.willItSnow,
      'chance_of_snow': instance.chanceOfSnow,
      'vis_km': instance.visKm,
      'vis_miles': instance.visMiles,
      'gust_mph': instance.gustMph,
      'gust_kph': instance.gustKph,
      'uv': instance.uv,
    };
