import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Cubits/weather%20cubit/weather_cubit.dart';
import 'package:weather_app/Cubits/weather%20cubit/weather_state.dart';
import 'package:weather_app/models/getweather.dart';
import 'package:weather_app/providers/weatherProvider.dart';
import 'package:weather_app/services/weatherservice.dart';
import 'screens/homescreen.dart';

void main(List<String> args) {
  runApp(
    BlocProvider(
      create: (BuildContext context) {
        return WeatherCubit(WeatherService());
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              BlocProvider.of<WeatherCubit>(context).weatherModel == null
                  ? Colors.blue
                  : BlocProvider.of<WeatherCubit>(context)
                      .weatherModel!
                      .getThemeColor()),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
