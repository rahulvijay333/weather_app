import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/favourites_controller.dart';
import 'package:weather_app/model/db/db.dart';

class Container1part2image extends StatelessWidget {
  Container1part2image({
    super.key,
    required this.size,
    required this.imageUrl,
    required this.locationName,
  });
  final String locationName;
  final Size size;
  final String imageUrl;

  final FavouritesController favouritesController =
      Get.put(FavouritesController());

  @override
  Widget build(BuildContext context) {
    favouritesController.checkFavStatus(locationName: locationName);
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: size.width * 0.40,
          height: size.height * 0.20,
          // color: Colors.white.withOpacity(0.3),
          child: Center(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 50,
            height: 40,
            color: Colors.white.withOpacity(0.5),
            child: Center(
              child: IconButton(onPressed: () {
                DataBaseModel location = DataBaseModel(
                    locName: locationName,
                    id: DateTime.now().microsecondsSinceEpoch.toString());
                favouritesController.addToFav(location: location);
              }, icon: GetX<FavouritesController>(
                builder: (controller) {
                  if (controller.checkFav.value == true) {
                    return Icon(
                      Icons.favorite,
                      color: Colors.red,
                    );
                  } else {
                    return Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    );
                  }
                },
              )),
            ),
          ),
        )
      ],
    );
  }
}
