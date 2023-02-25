import 'package:weather_app/models/getweather.dart';

abstract class WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatehrSuccess extends WeatherState {
  WeatherModel weatherModel;

  WeatehrSuccess({required this.weatherModel});
}

class WeatherFailure extends WeatherState {}

class WeatherInitial extends WeatherState {}
