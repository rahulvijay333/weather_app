import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/favourites_controller.dart';
import 'package:weather_app/controller/selected_location_controller.dart';
import 'package:weather_app/view/view_weather_selected/screen_selected_view.dart';

class ScreenFavorites extends StatelessWidget {
  ScreenFavorites({super.key});

  final SelectedLocationController selectedLocationController =
      Get.put(SelectedLocationController());

  final FavouritesController favouritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    favouritesController.getFavList();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.07,
                  width: size.width,
                  color: Colors.deepPurple,
                  child: Center(
                      child: Text(
                    'Favorites',
                    style: TextStyle(
                        fontSize: size.width * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )),
                ),
                Builder(builder: (context) {
                  return IconButton(
                      onPressed: () {
                        // log('drawer is clicked');
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                      ));
                }),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Expanded(
              child: GetX<FavouritesController>(
                builder: (controller) {
                  if (controller.favlist.isEmpty) {
                    return const Center(
                      child: Text('No favorites'),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            color: Colors.deepPurple.withOpacity(0.2),
                            child: InkWell(
                              onTap: () {
                                selectedLocationController.getWeatherDetails(
                                  localName: favouritesController
                                      .favlist[index].locName,
                                );

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return ScreenSelectedView(
                                      localName: favouritesController
                                          .favlist[index].locName,
                                    );
                                  },
                                ));
                              },
                              child: ListTile(
                                trailing: IconButton(
                                    onPressed: () {
                                      favouritesController.deleteFromFav(
                                          id: favouritesController
                                              .favlist[index].id);
                                    },
                                    icon: const Icon(Icons.delete)),
                                title: Text(
                                  favouritesController.favlist[index].locName,
                                  style: TextStyle(fontSize: size.width * 0.05),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      itemCount: controller.favlist.length,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
