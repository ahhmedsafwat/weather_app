import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/Cubits/weather%20cubit/weather_state.dart';

import 'package:weather_app/models/getweather.dart';

import '../Cubits/weather cubit/weather_cubit.dart';
import 'searchscreen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchScreen();
                }));
              },
            )
          ],
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatehrSuccess) {
              return SuccessBody(weatherData: state.weatherModel);
            } else if (state is WeatherFailure) {
              return Center(child: Text("Something went wrong"));
            } else {
              return DefultBody();
            }
          },
        ));
  }
}

class DefultBody extends StatelessWidget {
  const DefultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'There is No Weather 😔',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            'Start Searching 🔎',
            style: TextStyle(
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor()[700]!,
            weatherData!.getThemeColor()[200]!
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(
          flex: 3,
        ),
        Text(
          "${BlocProvider.of<WeatherCubit>(context).cityName}",
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Time is: ${weatherData!.getTime().toString()}:${weatherData!.date.minute.toString()}',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(weatherData!.getImage()),
            Text(
              ' ${weatherData!.temp.toInt()}',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Text('Max Temp : ${weatherData!.maxTemp.toInt()}'),
                Text('Min Temp : ${weatherData!.minTemp.toInt()}'),
              ],
            )
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        Text(
          weatherData!.weatherStateName,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(flex: 5),
      ]),
    );
  }
}
