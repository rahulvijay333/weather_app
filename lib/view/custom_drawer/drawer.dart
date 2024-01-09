import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/view/favs/screen_favourites.dart';
import 'package:weather_app/view/news/screen_view_news.dart';

class CustomNavDrawer extends StatelessWidget {
  CustomNavDrawer({
    super.key,
  });

  final WeatherController weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Colors.deepPurple.withOpacity(0.5),
      child: ListView(
        padding: const EdgeInsets.only(top: 100),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white.withOpacity(0.1),
                child: ListTile(
                  onTap: () {
                    Get.to(() => ScreenFavorites());
                    Scaffold.of(context).closeDrawer();
                  },
                  leading: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Favorite locations',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white.withOpacity(0.1),
                child: ListTile(
                  onTap: () {
                    Get.to(() => ScreenNews());
                    Scaffold.of(context).closeDrawer();
                  },
                  leading: const Icon(
                    Icons.newspaper,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Top News',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.white.withOpacity(0.1),
                child: ListTile(
                  onTap: () {
                    weatherController.resetApp();
                    Scaffold.of(context).closeDrawer();
                  },
                  leading: const Icon(
                    Icons.info,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Reset App',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
