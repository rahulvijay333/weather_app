import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controller/favourites_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/forcast/forcasted_weather_model/hour.dart';
import 'package:weather_app/view/custom_drawer/drawer.dart';
import 'package:weather_app/view/home/widgets/container3.dart';
import 'package:weather_app/view/home/widgets/forcast_time.dart';
import 'package:weather_app/view/home/widgets/row_container1.dart';
import 'package:weather_app/view/home/widgets/row_container2_img.dart';
import 'package:weather_app/view/home/widgets/show_time_schedule.dart';

class Screenhome extends StatelessWidget {
  Screenhome({super.key});
  final WeatherController weatherController = Get.put(WeatherController());
  final TextEditingController searchController = TextEditingController();
  final FavouritesController favouritesController =
      Get.put(FavouritesController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        drawer: CustomNavDrawer(),
        body: Column(
          children: [
            //----------------------custom appa bar
            Container(
              color: Colors.deepPurple,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.06,
                        width: size.width,
                        color: Colors.deepPurple,
                        child: Center(
                            child: Text(
                          'WeatherWave',
                          style: TextStyle(
                              fontSize: size.width * 0.05,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                      Builder(builder: (context) {
                        return IconButton(
                            onPressed: () {
                              log('drawer is clicked');

                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ));
                      }),
                    ],
                  ),
                  Container(
                    width: size.width,
                    color: Colors.deepPurple,
                    height: size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CupertinoSearchTextField(
                        style: const TextStyle(color: Colors.white),
                        padding: const EdgeInsets.all(5),
                        controller: searchController,
                        prefixIcon: const Icon(
                          Icons.wb_cloudy_outlined,
                          color: Colors.white,
                        ),
                        prefixInsets: const EdgeInsets.only(left: 10),
                        placeholder: 'Search location..',
                        placeholderStyle:
                            TextStyle(color: Colors.white.withOpacity(0.3)),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            weatherController.resetState();
                          }
                        },
                        onSubmitted: (value) {
                          FocusScope.of(context).unfocus();
                          weatherController.getWeatherDetails(
                              searchName: searchController.text);
                        },
                        suffixInsets: const EdgeInsets.only(right: 10),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onSuffixTap: () {
                          log('search clicked');
                          FocusScope.of(context).unfocus();
                          weatherController.getWeatherDetails(
                              searchName: searchController.text);
                        },
                        backgroundColor: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
                child: GetX<WeatherController>(
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
                                  controller.getWeatherDetails(searchName: '');
                                },
                                icon: const Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      );
                    } else if (controller.isLoading.value == true) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1,
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
                          'No search results',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    } else {
                      String imageUrl =
                          "https:${controller.currentWeather.value!.current!.condition!.icon}";
                      //--------------------------------------------------------------parsing time
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

                      //-------------------------------------------------------<<<<<<<-----time parsing
                      List<Hour> timeList = [];

                      for (var time in weatherController.currentWeather.value!
                          .forecast!.forecastday![0].hour!) {
                        timeList.add(time);
                      }
                      return ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          //---------------------------------------------------1st
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //---------------------current details
                              Container1(
                                size: size,
                                formattedDate: formattedDate,
                                weatherController: weatherController,
                              ),

                              //current image status
                              Flexible(
                                child: Container1part2image(
                                  size: size,
                                  imageUrl: imageUrl,
                                  locationName: weatherController
                                      .currentWeather.value!.location!.name!,
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weatherController
                                    .currentWeather.value!.location!.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontSize: size.width * 0.050),
                              ),
                              Text(
                                weatherController
                                    .currentWeather.value!.location!.country!,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontSize: size.width * 0.030),
                              ),
                              SizedBox(
                                height: size.height * 0.5 * 0.02,
                              ),
                              //------------------------local time
                              Text(
                                formattedDate,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: size.width * 0.040),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          //----------------------------------------------------2nd
                          container3(
                            size: size,
                            weatherController: weatherController,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          //---------------------------------------------------3rd
                          Text(
                            'Today',
                            style: TextStyle(
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: size.width * 0.01,
                          ),
                          //---------------------------------------------------4th
                          Center(
                            child:
                                showTodayWeatherTimeWiseWidget(size, timeList),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            'Forcast',
                            style: TextStyle(
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),

                          SizedBox(
                            height: size.height * 0.001,
                          ),
                          Center(
                            child: SizedBox(
                              height: size.height * 0.14,
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
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
                                    child: Forcast3DayWidget(
                                      size: size,
                                      dayDetails: weatherController
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
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
