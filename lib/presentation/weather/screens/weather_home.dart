import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/presentation/weather/bloc/selected_weather/selected_weather_bloc.dart';
import 'package:weather_app/presentation/weather/screens/widgets/current_weather_widget.dart';

import '../../../utils/common_widgets.dart';

import '../../../utils/dependency_injection.dart/injector.dart';
import '../bloc/forecast_weather/weather_bloc.dart';

import '../bloc/temp_conversion_bloc/temp_convert_bloc.dart';
import 'widgets/forecast_weather_widget.dart';

class WeatherHome extends StatefulWidget {
  @override
  State<WeatherHome> createState() => _WeatherHome();
}

class _WeatherHome extends State<WeatherHome> {
  late WeatherForecastBloc weatherForecastBloc;
  late SelectedWeatherBloc selectedWeatherBloc;
  @override
  void initState() {
    super.initState();
    selectedWeatherBloc = getIt<SelectedWeatherBloc>() //get current weather
      ..add(GetCurrentWeather());
    weatherForecastBloc =
        getIt<WeatherForecastBloc>() //get 5 days weather forecast data
          ..add(GetWeatherForecastEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: getText20HeadingWidget("Berlin Mitte", context: context),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          weatherForecastBloc.add(WeatherForecastRefreshRequested());
          selectedWeatherBloc.add(WeatherCurrentRefreshRequested());
          BlocProvider.of<TemperatureConvertBloc>(context)
              .add(TemoperatureUnitReset());
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurrentWeatherWidget(
                selectedWeatherBloc: selectedWeatherBloc,
                weatherForecastBloc: weatherForecastBloc,
              ),
              ForecastWeatherWidget(
                  weatherForecastBloc: weatherForecastBloc,
                  selectedWeatherBloc: selectedWeatherBloc),
            ],
          ),
        ),
      ),
    );
  }
}
