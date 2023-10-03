import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/constants/const/common.dart';

class IconTextWidgetCustom extends StatelessWidget {
  const IconTextWidgetCustom({
    super.key,
    required this.size,
    required this.icon,
    required this.title,
    required this.value,
    required this.heightC,
    required this.widthC,
  });

  final Size size;

  final IconData icon;
  final String title;
  final String value;
  final double heightC;
  final double widthC;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.height * 0.12 * 0.8,
      // color: Colors.amber,
      // width: size.width * 0.5 * 0.40,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              // fontSize: size.width * 0.5 * 0.40 * 0.20
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
