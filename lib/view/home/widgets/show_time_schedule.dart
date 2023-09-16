import 'package:flutter/material.dart';
import 'package:weather_app/model/forcast/forcasted_weather_model/hour.dart';

import 'package:weather_app/view/home/widgets/forecast_time_tile.dart';

Container showTodayWeatherTimeWiseWidget(Size size, List<Hour> timeList) {
  return Container(
    height: size.height * 0.14,
    child: ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 5,
        );
      },
      itemCount: timeList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Center(
          child: ForcastTimeTile(
            size: size,
            dayDetails: timeList[index],
          ),
        );
      },
    ),
  );
}



