import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/route_manager.dart';

import 'package:weather_app/constants/api_endpoints/api_ends.dart';
import 'package:weather_app/constants/key/api_key.dart';
import 'package:weather_app/model/news/news_model/news_model.dart';

class NewsController extends GetxController {
  var newsList = Rx<NewsModel?>(null);
  RxBool isloading = false.obs;
  RxBool isError = false.obs;
  RxBool isNetworkError = false.obs;

  @override
  void onReady() async {
    getNewsList();
    super.onReady();
  }

  //
  Future<void> getNewsList() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      isNetworkError.value = false;

      isloading.value = true;

      try {
        final dio = Dio();

        final Response response = await dio.get(
          ApiEndPoints.getNewsList,
          queryParameters: {'q': 'climate', 'apiKey': newApiKey},
        );
        // log(response.statusCode.toString());
        if (response.statusCode == 200) {
          try {
            newsList.value = NewsModel.fromJson(response.data);

            isloading.value = false;

            return;
          } catch (e) {
            log('error is parsing data $e');
            return;
          }
        } else if (response.statusCode == 404) {
          log('Something is wrong / no results');
        }
      } catch (e) {
        isloading.value = false;
        if (e is DioException) {
          if (e.error is SocketException) {
            showSnackbar(message: 'Not conected to internet');
            log('Internet connectivity error');
          } else if (e.response!.statusCode == 400) {
            showSnackbar(message: 'Bad request');
          } else if (e.response!.statusCode == 401) {
            showSnackbar(message: 'Unauthorized request');
          } else if (e.response!.statusCode == 429) {
            showSnackbar(message: 'Try, after sometime');
          } else if (e.response!.statusCode == 500) {
            showSnackbar(message: 'Server is down, Please try lator');
          }
        } else {
          log('Some error happened');
          log(e.toString());
        }
        isloading.value = false;
        isError.value = true;
      }
    } else {
      isNetworkError.value = true;
    }
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
}
