import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/constants/api_endpoints/api_ends.dart';
import 'package:weather_app/constants/key/api_key.dart';
import 'package:weather_app/model/forcast/forcasted_weather_model/forcasted_weather_model.dart';

class WeatherController extends GetxController {
  late SharedPreferences sharedPreferences;
  var currentWeather = Rx<ForcastedWeatherModel?>(null);
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxBool reset = false.obs;
  RxBool networkError = false.obs;

  void resetState() {
    isError.value = false;
  }

  void resetApp() async {
    sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.clear();
    getWeatherDetails(searchName: '');
    currentWeather.value = null;
  }

  @override
  void onReady() async {
    checkConnectivity();
    super.onReady();
  }

  void checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      networkError.value = false;

      String? checkValue = await getValue();
      if (checkValue != null) {
        getWeatherDetails(searchName: checkValue);
      } else {
        getWeatherDetails(searchName: '');
      }
    } else {
      networkError.value = true;
    }
  }

  void saveToDb({required String searchKey}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    log('key saved');
    sharedPreferences.setString('key', searchKey);
  }

  Future<String?> getValue() async {
    sharedPreferences = await SharedPreferences.getInstance();

    String? values = sharedPreferences.getString('key');
    log(values.toString());

    return values;
  }

  Future<void> getWeatherDetails({required String searchName}) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      networkError.value = false;

      if (searchName.isEmpty) {
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
          queryParameters: {'q': searchName, 'days': 3},
        );
        // log(response.statusCode.toString());
        if (response.statusCode == 200) {
          try {
            log('checking fro error int ry');
            currentWeather.value =
                ForcastedWeatherModel.fromJson(response.data);

            saveToDb(searchKey: searchName);
            isLoading.value = false;

            // log(currentWeather.value!.forecast!.forecastday!.length.toString());
            return;
          } catch (e) {
            log('error is parsing data $e');
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
