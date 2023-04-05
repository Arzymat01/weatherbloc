import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherbloc/models/weather_response.dart';
import 'package:weatherbloc/services/fetch_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  final WeatherService weatherService;

  Future<void> getWeatherCityName(String cityname) async {
    emit(WetherLoafing());
    final data = await weatherService.getWeatherByCityName(cityname);
    if (data != null) {
      emit(WeatherSucces(data));
    } else {
      emit(const WeatherError('katakettin'));
    }
  }
}
