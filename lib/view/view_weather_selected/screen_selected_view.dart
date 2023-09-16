import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/selected_location_controller.dart';
import 'package:weather_app/model/selected_location/selected_location_model/hour.dart';
import 'package:weather_app/view/home/widgets/show_time_schedule.dart';
import 'package:weather_app/view/view_weather_selected/widgets/forecase_tile.dart';
import 'package:weather_app/view/view_weather_selected/widgets/show_details_cont1.dart';
import 'package:weather_app/view/view_weather_selected/widgets/today_time_forecast.dart';

class ScreenSelectedView extends StatelessWidget {
  ScreenSelectedView({super.key, required this.localName});

  final String localName;
  

  final SelectedLocationController selectedLocationController =
      Get.put(SelectedLocationController());

  @override
  Widget build(BuildContext context) {
    log('selected $localName');
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.deepPurple,
            body: Column(
              children: [
                Stack(
                  children: [
                    appbarCustom(size: size, localName: localName),
                    // Builder(builder: (context) {
                    //   return IconButton(
                    //       onPressed: () {
                    //         Navigator.of(context).pop();
                    //       },
                    //       icon: const Icon(
                    //         Icons.arrow_back_ios_new,
                    //         color: Colors.white,
                    //       ));
                    // }),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ))
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: GetX<SelectedLocationController>(
                      builder: (controller) {
                        if (controller.networkError.isTrue) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Not Connected to Internet',
                                    style: TextStyle(color: Colors.white)),
                                const SizedBox(
                                  height: 10,
                                ),
                                IconButton(
                                    onPressed: () {
                                      selectedLocationController
                                          .getWeatherDetails(
                                              localName: localName);
                                      // controller.getWeatherDetails(searchName: '');
                                    },
                                    icon: const Icon(
                                      Icons.refresh,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          );
                        } else if (controller.isLoading.value == true) {
                          return Container(
                            height: size.height,
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1,
                              ),
                            ),
                          );
                        } else if (controller.currentWeather.value == null) {
                          return const Center(
                              child: Text(
                            'Welcome to WeatherWave',
                            style: TextStyle(color: Colors.white),
                          ));
                        } else if (controller.isError.value == true) {
                          return const Center(
                            child: Text(
                              'Error',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        } else {
                          final getValue = controller.currentWeather.value;
                          String imageUrl =
                              "https:${controller.currentWeather.value!.current!.condition!.icon}";
                         


                                List<Hour> timeList = [];

                      for (var time in selectedLocationController.currentWeather.value!
                          .forecast!.forecastday![0].hour!) {
                        final checktime = DateTime.parse(time.time!);

                        if (checktime.isAtSameMomentAs(DateTime.now()) ||
                            checktime.isAfter(DateTime.now())) {
                          timeList.add(time);
                        }
                      }
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  showCurrentWeatherDetails(
                                      size: size,
                                      imageUrl: imageUrl,
                                      getValue: getValue),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                        fontSize: size.width * 0.045,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        showTodayWeatherTimeWiseWidgetSelected(
                                            size, timeList),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Center(
                                    child: Text(
                                      '3-Day Forecast',
                                      style: TextStyle(
                                          fontSize: size.width * 0.045,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.001,
                                  ),
                                  Center(
                                    child: Container(
                                      height: size.height * 0.14,
                                      child: ListView.separated(
                                        physics:
                                            const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            width: 5,
                                          );
                                        },
                                        itemCount: 3,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Center(
                                            child: ForcastTile(
                                              size: size,
                                              dayDetails:
                                                  selectedLocationController
                                                      .currentWeather
                                                      .value!
                                                      .forecast!
                                                      .forecastday![index],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            )));
  }
}

class appbarCustom extends StatelessWidget {
  const appbarCustom({
    super.key,
    required this.size,
    required this.localName,
  });

  final Size size;
  final String localName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.07,
      width: size.width,
      color: Colors.deepPurple,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            localName,
            style: TextStyle(
                fontSize: size.width * 0.05,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          GetX<SelectedLocationController>(
            builder: (controller) {
              if (controller.isLoading.value == true ||
                  controller.isError.value == true ||
                  controller.networkError.value == true) {
                return SizedBox();
              }

              String localTimeString =
                  controller.currentWeather.value!.location!.localtime!;

              List<String> parts = localTimeString.split(' ');

              if (parts.length == 2) {
                String datePart = parts[0];
                String timePart = parts[1];

                // Split the time part into hours and minutes
                List<String> timeParts = timePart.split(':');

                if (timeParts.length == 2) {
                  String hours = timeParts[0];
                  String minutes = timeParts[1];

                  // Ensure hours have two digits with a leading zero
                  hours = hours.padLeft(2, '0');

                  // Recreate the modified datetime string
                  localTimeString = '$datePart $hours:$minutes';
                }
              }

              final formattedDate = DateFormat('EEEE, hh:mm a')
                  .format(DateTime.parse(localTimeString).toLocal());
              return Text(
                formattedDate,
                style: TextStyle(
                    fontSize: size.width * 0.035,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              );
            },
          )
        ],
      )),
    );
  }
}
