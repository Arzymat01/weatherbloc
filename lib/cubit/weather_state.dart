part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WetherLoafing extends WeatherState {}

class WeatherSucces extends WeatherState {
  final WeatherResponse weatherResponse;

  const WeatherSucces(this.weatherResponse);
}

class WeatherError extends WeatherState {
  const WeatherError(this.errorText);
  final String errorText;
}
