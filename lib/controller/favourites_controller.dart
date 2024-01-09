import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/model/db/db.dart';

class FavouritesController extends GetxController {
  var favlist = <DataBaseModel>[].obs;
  RxBool checkFav = false.obs;

  getFavList() async {
    final hivebox = await Hive.openBox<DataBaseModel>(favoritesDBName);

    List<DataBaseModel> favs = hivebox.values.toList();

    favlist.assignAll(favs);
  }
  

  addToFav({required DataBaseModel location}) async {
    final hivebox = await Hive.openBox<DataBaseModel>(favoritesDBName);
    var locationLists = hivebox.values.toList();

    bool locaStatus = locationLists
        .where((name) =>
            name.locName.toLowerCase() == location.locName.toLowerCase())
        .isEmpty;
    if (locaStatus) {
      hivebox.put(location.id, location);
      checkFavStatus(locationName: location.locName);
      showSnackbar(message: 'Added to favorites');
    } else {
      int index = locationLists.indexWhere((name) =>
          name.locName.toLowerCase() == location.locName.toLowerCase());

      hivebox.deleteAt(index);
      checkFavStatus(locationName: location.locName);
      showSnackbar(message: 'removed from favorites');
    }
    getFavList();
  }

  SnackbarController showSnackbar({required String message}) {
    return Get.snackbar('', '',
        messageText: Text(
          message,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        titleText: const Text(
          'Status',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(25),
        snackStyle: SnackStyle.FLOATING);
  }

  Future<void> deleteFromFav({required String id}) async {
    final hiveBox = await Hive.openBox<DataBaseModel>(favoritesDBName);
   

    final item = hiveBox.get(id);
    if (item != null) {
      try {
        hiveBox.delete(id);
        getFavList();
        Get.snackbar('', '',
            messageText: const Text(
              'Location deleted succefully',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            backgroundColor: Colors.deepPurple,
            titleText: const Text(
              'Status',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(25),
            snackStyle: SnackStyle.FLOATING);
      } catch (e) {
        showSnackbar(message: 'Error occured');
      }
    } else {
      showSnackbar(message: 'Error occured');
    }
  }

  

  checkFavStatus({required String locationName}) async {
    final hivebox = await Hive.openBox<DataBaseModel>(favoritesDBName);

    final favlist = hivebox.values.toList();

    if (favlist
            .where((name) =>
                name.locName.toLowerCase() == locationName.toLowerCase())
            .isEmpty ==
        false) {
      checkFav.value = true;
    } else {
     
      checkFav.value = false;
    }
  }
}
