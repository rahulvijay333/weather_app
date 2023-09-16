
import 'package:flutter/material.dart';
import 'package:weather_app/constants/const/common.dart';
import 'package:weather_app/model/selected_location/selected_location_model/selected_location_model.dart';
import 'package:weather_app/view/view_weather_selected/widgets/iconPlusTextImage.dart';

class showCurrentWeatherDetails extends StatelessWidget {
  const showCurrentWeatherDetails({
    super.key,
    required this.size,
    required this.imageUrl,
    required this.getValue,
  });

  final Size size;
  final String imageUrl;
  final SelectedLocationModel? getValue;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: size.height * 0.25,
        width: size.width,
        color: Colors.white.withOpacity(0.15),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: size.width * 0.45,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    '${getValue!.current!.tempC}${digree}C',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.08,
                        fontWeight:
                            FontWeight.w800),
                  ),
                  Text(
                    getValue
                        !.current!.condition!.text!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            size.width * 0.05),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  SizedBox(
                      child: Text(
                    'Feels like ${getValue!.current!.feelslikeC}${digree}C',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ))
                ],
              ),
            ),
            //---------------------------------------------container - part 2
            Container(
              width: size.width * 0.45,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceEvenly,
                    children: [
                      IconTextWidgetCustom(
                          size: size,
                          icon: Icons.air,
                          title: 'wind',
                          value:
                              '${getValue!.current!.windKph!.toInt().toString()} Km/h',
                          heightC: 2,
                          widthC: 2),
                      IconTextWidgetCustom(
                          size: size,
                          icon: Icons.water_drop,
                          title: 'Humidity',
                          value: getValue
                              !.current!.humidity!
                              .toInt()
                              .toString(),
                          heightC: 2,
                          widthC: 2),
                      IconTextWidgetCustom(
                          size: size,
                          icon:
                              Icons.cloudy_snowing,
                          title: 'Rain',
                          value:
                              '${getValue!.forecast!.forecastday![0].day!.dailyChanceOfRain!.toString()} %',
                          heightC: 2,
                          widthC: 2)
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceEvenly,
                    children: [
                      IconTextWidgetCustom(
                          size: size,
                          icon: Icons.sunny,
                          title: 'UV Index',
                          value: getValue
                              !.current!.uv!
                              .toInt()
                              .toString(),
                          heightC: 2,
                          widthC: 2),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(
                                10),
                        child: Container(
                          color: Colors.white
                              .withOpacity(0.2),
                          child: Padding(
                            padding:
                                const EdgeInsets
                                    .all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons8-sunrise-50.png',
                                      width: 25,
                                      height: 25,
                                    ),
                                    Text(
                                      getValue!
                                          .forecast!
                                          .forecastday![
                                              0]
                                          .astro!
                                          .sunrise!,
                                      style: const TextStyle(
                                          color: Colors
                                              .white),
                                    )
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons8-sunset-50.png',
                                      width: 25,
                                      height: 25,
                                    ),
                                    Text(
                                        getValue!
                                            .forecast!
                                            .forecastday![
                                                0]
                                            .astro!
                                            .sunset!,
                                        style: const TextStyle(
                                            color: Colors
                                                .white))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      
    );
  }
}
