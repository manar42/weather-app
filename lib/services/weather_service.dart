import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/Oops.dart';


class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '17945e87d79e4a33b9792038241511';

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response =
        await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }

  Future<WeatherModel> getForcast({required cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          Oops(message: e.message!).toString();
      // TODO
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(Oops(message: e.toString()).toString());
    }
  }
}
