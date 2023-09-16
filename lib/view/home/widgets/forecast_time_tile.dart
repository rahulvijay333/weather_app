import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/const/common.dart';
import 'package:weather_app/model/forcast/forcasted_weather_model/hour.dart';

class ForcastTimeTile extends StatelessWidget {
  const ForcastTimeTile(
      {super.key, required this.size, required this.dayDetails});

  final Size size;

  final Hour dayDetails;

  @override
  Widget build(BuildContext context) {
    final formtedDate =
        DateFormat('h a').format(DateTime.parse(dayDetails.time!));
    String imageUrl = "https:${dayDetails.condition!.icon}";

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.16,
        //  height: size.height * 0.3 * 0.5,
        color: Colors.white.withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formtedDate,
              style: TextStyle(
                  color: Colors.white, fontSize: size.width * 0.16 * 0.25),
            ),
            Image.network(
              imageUrl,
              width: 50,
              height: 50,
            ),
            Text('${dayDetails.tempC!.toInt()}${digree}C',
                style: TextStyle(
                    color: Colors.white, fontSize: size.width * 0.16 * 0.24))
          ],
        ),
      ),
    );
  }
}
