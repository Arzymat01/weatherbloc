import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherbloc/cubit/weather_cubit.dart';
import 'package:weatherbloc/models/weather_response.dart';
import 'package:weatherbloc/services/fetch_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherCubit(weatherService)..getWeatherCityName('osh'),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const Text('WeatherInitial');
            } else if (state is WetherLoafing) {
              return const CircularProgressIndicator();
            } else if (state is WeatherSucces) {
              return WeatherSuccesWidget(state.weatherResponse);
            } else if (state is WeatherError) {
              return const Text(' WeatherError');
            } else {
              return const Text('No');
            }
          },
        ),
      ),
    );
  }
}

class WeatherSuccesWidget extends StatelessWidget {
  const WeatherSuccesWidget(this.weatherResponse, {super.key});
  final WeatherResponse weatherResponse;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weatherResponse.name),
          Text(weatherResponse.weather[0].id.toString()),
          Text(weatherResponse.weather[0].main.toString()),
          Text(weatherResponse.weather[0].description.toString()),
          Text(weatherResponse.weather[0].icon.toString()),
          Text(weatherResponse.main.temp.toString()),
          Text(weatherResponse.main.feelsLike.toString()),
          Text(weatherResponse.main.tempMax.toString()),
          Text(weatherResponse.main.tempMin.toString()),
        ],
      ),
    );
  }
}
