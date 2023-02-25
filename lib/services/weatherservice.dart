import 'dart:convert';

import '../models/getweather.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/getweather.dart';

class WeatherService {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apiKey = '2cb9fd1f07a246869a1192136231001';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseurl/forecast.json?key=$apiKey&q=$cityName&days=5');

    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromjson(data);
    return weather;
  }
}
