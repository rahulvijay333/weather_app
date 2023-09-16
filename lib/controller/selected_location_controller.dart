import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_app/constants/api_endpoints/api_ends.dart';
import 'package:weather_app/constants/key/api_key.dart';
import 'package:weather_app/model/selected_location/selected_location_model/selected_location_model.dart';

class SelectedLocationController extends GetxController {
  var currentWeather = Rx<SelectedLocationModel?>(null);
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxBool reset = false.obs;
  RxBool networkError = false.obs;

  Future<void> getWeatherDetails({required String localName}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      networkError.value = false;

      if (localName.isEmpty) {
        isLoading.value = false;
        return;
      }
      isLoading.value = true;

      try {
        final dio = Dio();

        dio.options.headers = {
          'Content-Type': 'application/json',
          'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
          'X-RapidAPI-Key': apiKey
        };

        final Response response = await dio.get(
          ApiEndPoints.getForcastedWeather,
          queryParameters: {'q': localName, 'days': 3, 'aqi': 'yes'},
        );

        if (response.statusCode == 200) {
          try {
            currentWeather.value =
                SelectedLocationModel.fromJson(response.data);

            isLoading.value = false;

            return;
          } catch (e) {
            return;
          }
        } else if (response.statusCode == 404) {
          log('Something is wrong / no results');
        }
      } catch (e) {
        isLoading.value = false;
        if (e is DioException) {
          if (e.error is SocketException) {
            log('Internet connectivity error');
          }
        } else {
          log('Some error happened');
          log(e.toString());
        }
        isLoading.value = false;
        isError.value = true;
      }
    } else {
      networkError.value = true;
    }
  }
}
