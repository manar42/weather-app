

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/weather_forecast_details_body.dart';

class WeatherForecastDetailsView extends StatelessWidget {
  const WeatherForecastDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
     final weatherService = WeatherService(Dio());
    return  WeatherForecastDetailsBody(weatherService:weatherService ,);
  }
}