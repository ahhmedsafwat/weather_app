import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Cubits/weather%20cubit/weather_cubit.dart';
import 'package:weather_app/models/getweather.dart';
import 'package:weather_app/providers/weatherProvider.dart';
import 'package:weather_app/services/weatherservice.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Your City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            child: TextField(
              onChanged: (value) {
                cityName = value;
              },
              // onChanged: (data) => print(data),
              onSubmitted: (data) async {
                cityName = data;

                BlocProvider.of<WeatherCubit>(context).getWeather(
                  cityName: cityName!,
                );
                BlocProvider.of<WeatherCubit>(context).cityName = cityName;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                hintText: 'Enter City',
                border: const OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: (() async {
                    BlocProvider.of<WeatherCubit>(
                      context,
                    ).getWeather(cityName: cityName!);
                    BlocProvider.of<WeatherCubit>(context).cityName = cityName;

                    Navigator.pop(context);
                  }),
                  child: const Icon(Icons.search),
                ),
                label: const Text('Search'),
                labelStyle: const TextStyle(fontSize: 20),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
