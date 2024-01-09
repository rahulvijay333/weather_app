import 'package:weather_app/constants/key/api_key.dart';

class ApiEndPoints {
  static const baseUrl = 'https://weatherapi-com.p.rapidapi.com';
  static const newBaseUrl = 'http://api.weatherapi.com/v1';

  static const getCurrentWeather = '$newBaseUrl/current.json?key=$neWApiKey';
  static const getForcastedWeather = '$newBaseUrl/forecast.json?key=$neWApiKey';
  static const getNewsList = 'https://newsapi.org/v2/everything';
}
