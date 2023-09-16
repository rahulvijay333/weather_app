import 'dart:developer';

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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
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
    // Check if the item with the specified ID exists

    final item = hiveBox.get(id);
    if (item != null) {
      try {
        hiveBox.delete(id);
        getFavList();
        log('Location deleted: $id');
      } catch (e) {
        log('Error deleting location: $e');
      }
    } else {
      log('Item with ID $id not found.');
    }
  }

  resetFav() {
    // checkFav.value = false;
  }

  checkFavStatus({required String locationName}) async {
    final hivebox = await Hive.openBox<DataBaseModel>(favoritesDBName);

    final favlist = hivebox.values.toList();

    log('searching status of $locationName');

    if (favlist
            .where((name) =>
                name.locName.toLowerCase() == locationName.toLowerCase())
            .isEmpty ==
        false) {
      log('location  present');

      checkFav.value = true;
    } else {
      log('location not present in db');
      // log(checkFav.value.toString());
      checkFav.value = false;
    }
  }
}
