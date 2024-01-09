import 'package:flutter/material.dart';
import 'package:weather_app/constants/const/common.dart';
import 'package:weather_app/controller/weather_controller.dart';

class Container1 extends StatelessWidget {
  const Container1({
    super.key,
    required this.size,
    required this.formattedDate,
    required this.weatherController,
  });

  final Size size;
  final String formattedDate;
  final WeatherController weatherController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${weatherController.currentWeather.value!.current!.tempC!.toInt()}\u00B0C',
            style: TextStyle(color: Colors.white, fontSize: size.width * 0.2),
          ),
          SizedBox(
            height: size.height * 0.5 * 0.006,
          ), //current status
          Text(
            weatherController.currentWeather.value!.current!.condition!.text!,
            style: TextStyle(color: Colors.white, fontSize: size.width * 0.05),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            height: size.height * 0.5 * 0.07,
            child: Text(
              'Feels like ${weatherController.currentWeather.value!.current!.feelslikeC}${digree}C',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: size.height * 0.5 * 0.02,
          ),
        ],
      ),
    );
  }
}
