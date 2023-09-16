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
      // height: size.height * 0.30,
      // color: Colors.white.withOpacity(0.5),
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
            child: Text(
              'Feels like ${weatherController.currentWeather.value!.current!.feelslikeC}${digree}C',
              style: const TextStyle(color: Colors.white),
            ),
            height: size.height * 0.5 * 0.07,
          ),
          SizedBox(
            height: size.height * 0.5 * 0.02,
          ),
          // Text(
          //   weatherController.currentWeather.value!.location!.name!,
          //   style: TextStyle(
          //       fontWeight: FontWeight.w300,
          //       color: Colors.white,
          //       fontSize: size.width * 0.050),
          // ),
          // Text(
          //   weatherController.currentWeather.value!.location!.country!,
          //   style: TextStyle(
          //       fontWeight: FontWeight.w300,
          //       color: Colors.white,
          //       fontSize: size.width * 0.030),
          // ),
          // SizedBox(
          //   height: size.height * 0.5 * 0.02,
          // ),
          // //------------------------local time
          // Text(
          //   formattedDate,
          //   style: TextStyle(
          //       fontWeight: FontWeight.w400,
          //       color: Colors.white,
          //       fontSize: size.width * 0.040),
          // )
        ],
      ),
    );
  }
}
