import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weatherbloc/constants/api_const.dart';
import 'package:weatherbloc/models/weather_response.dart';

class WeatherService {
  final client = http.Client();

  Future<WeatherResponse?> getWeatherByCityName(String cityname) async {
    final uri = Uri.parse(ApiConst.weatherBySityName(cityname));

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final weathet = WeatherResponse.fromJson(response.body);
        return weathet;
      } else {
        log('response.statusCode:${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('getWeatherByCityName metodunda lata boldu $e');
      return null;
    }
  }
}

final weatherService = WeatherService();
