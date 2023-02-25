import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStateName;

  WeatherModel({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
    required this.weatherStateName,
  });

  factory WeatherModel.fromjson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
      date: DateTime.parse(data["current"]["last_updated"]),
      maxTemp: jsonData["maxtemp_c"],
      minTemp: jsonData["mintemp_c"],
      temp: jsonData["avgtemp_c"],
      weatherStateName: jsonData["condition"]["text"],
    );
  }

  String getImage() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'rainy' ||
        weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Patchy rain possible') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Snowy') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Cloudy' ||
        weatherStateName == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Thunderstorms') {
      return ' assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'Clear') {
      return Colors.orange;
    } else if (weatherStateName == 'rainy' ||
        weatherStateName == 'Moderate rain' ||
        weatherStateName == 'Patchy rain possible') {
      return Colors.blue;
    } else if (weatherStateName == 'Snowy') {
      return Colors.cyan;
    } else if (weatherStateName == 'Cloudy' ||
        weatherStateName == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Thunderstorms') {
      return Colors.lightBlue;
    } else {
      return Colors.orange;
    }
  }

  getTime() {
    return date.hour > 12 ? date.hour - 12 : date.hour;
  }
  // @override
  // String toString() {
  //   return 'temp = $temp, mintemp = $minTemp, maxtemp = $maxTemp, date = $date, weather state = $weatherStateName';
  // }
}
