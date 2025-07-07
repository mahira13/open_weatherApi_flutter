import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/weather/bloc/forecast_weather/weather_bloc.dart';
import 'package:weather_app/presentation/weather/bloc/selected_weather/selected_weather_bloc.dart';
import 'package:weather_app/presentation/weather/bloc/temp_conversion_bloc/temp_convert_bloc.dart';
import 'package:weather_app/presentation/weather/screens/weather_home.dart';
import 'package:weather_app/utils/constants/app_strings.dart';
import 'package:weather_app/utils/dependency_injection.dart/injector.dart';

import 'config/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies(); //dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WeatherForecastBloc>(
            create: (context) => getIt<WeatherForecastBloc>(),
          ),
          BlocProvider<SelectedWeatherBloc>(
            create: (context) => getIt<SelectedWeatherBloc>(),
          ),
          //
          BlocProvider<TemperatureConvertBloc>(
            create: (context) => TemperatureConvertBloc(),
          ),
        ],
        child: MaterialApp(
          builder: (BuildContext context, Widget? child) {
            final MediaQueryData data = MediaQuery.of(context);

            return MediaQuery(
              data: data.copyWith(
                textScaleFactor: data.textScaleFactor > 1.2
                    ? 1.2
                    : data.textScaleFactor * 1.05,
              ),
              child: child!,
            );
          },
          home: WeatherHome(),
          debugShowCheckedModeBanner: false,
          title: appTitle,
          theme: AppTheme.light,
        ));
  }
}
