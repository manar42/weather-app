import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/Oops.dart';
//request عشان تعمل  Dio بنستخدام باكدج

class WeatherService {
  //object
  final Dio dio;
// costractor
  WeatherService(this.dio);
// بعملهم ع شكل متغير وبعيد استخدامهم
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '17945e87d79e4a33b9792038241511';
  //  بيانات اللي رجعالي كدا كدا من WeatherModel
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    // req
    Response response = // response
        await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3');

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    // انشات اوبجكت من الوزيرموديل 

    return weatherModel;
  }

// دا الرد اللي هيرجع في حالة ان مفيش مشاكل
  Future<WeatherModel> getForcast({required cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
//
    } on DioException catch (e) {

      //   لو حصل ايرور بروح اجيب الماسدج ايرور
      final String errorMessage = e.response?.data['error']['message'] ??
          Oops(message: e.message!).toString();
// بهندل الاكسبشن
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(Oops(message: e.toString()).toString());
    }
  }
}
