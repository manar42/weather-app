//import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/views/splash_view.dart';
import 'package:weather_app/widgets/temperature_unit_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
       
      
    

  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (_) => GetWeatherCubit()),
        ChangeNotifierProvider(create: (_) => TemperatureUnitNotifier()), 
      ],
      child: const WeatherForeCast(),
    ),
  );
}

class WeatherForeCast extends StatelessWidget {
  const WeatherForeCast({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff1D2837),
      ),
      home: const SplashView(),
    );
  }
}
