//humidy//rain..wind
import 'package:flutter/material.dart';
import 'package:weather_app/view/home/widgets/mid_status_c3.dart';

import '../../../controller/weather_controller.dart';

class container3 extends StatelessWidget {
  const container3({
    super.key,
    required this.size,
    required this.weatherController,
  });

  final Size size;
  final WeatherController weatherController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.5,
        height: size.height * 0.12,
        color: Colors.white.withOpacity(0.1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomMidStatusItemsWidget(
              size: size,
              icon: Icons.air_outlined,
              title: 'Wind',
              value:
                  '${weatherController.currentWeather.value!.current!.windKph!.toInt().toString()} km/h',
            ),
            CustomMidStatusItemsWidget(
                size: size,
                icon: Icons.water_drop,
                title: 'humidity',
                value:
                    '${weatherController.currentWeather.value!.current!.humidity}%'),
            CustomMidStatusItemsWidget(
              size: size,
              icon: Icons.cloudy_snowing,
              title: 'Rain',
              value:
                  '${weatherController.currentWeather.value!.current!.precipIn!.toString()}%',
            ),
          ],
        ),
      ),
    );
  }
}
