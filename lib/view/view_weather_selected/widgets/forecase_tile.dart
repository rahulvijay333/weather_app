import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/const/common.dart';
import 'package:weather_app/model/selected_location/selected_location_model/forecastday.dart';

class ForcastTile extends StatelessWidget {
  const ForcastTile({
    super.key,
    required this.size,
    required this.dayDetails,
  });

  final Size size;
  final Forecastday dayDetails;

  @override
  Widget build(BuildContext context) {
    final formtedDate =
        DateFormat('d EEE').format(DateTime.parse(dayDetails.date!));
    String imageUrl = "https:${dayDetails.day!.condition!.icon}";

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: size.width * 0.30,
        //  height: size.height * 0.3 * 0.5,
        color: Colors.white.withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formtedDate,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.30 * 0.14,
                  fontWeight: FontWeight.w700),
            ),
            Image.network(
              imageUrl,
              // width: 50,
              // height: 50,
            ),
            Text('${dayDetails.day!.avgtempC!.toInt()}${digree}C',
                style: const TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}