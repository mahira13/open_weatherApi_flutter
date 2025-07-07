import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/utils/extensions/double_extensions.dart';
import 'package:weather_app/utils/extensions/widget_extensions.dart';

import '../../../../utils/common_widgets.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/models/weather_data.dart';
import '../../bloc/forecast_weather/weather_bloc.dart';
import '../../bloc/selected_weather/selected_weather_bloc.dart';
import '../../bloc/temp_conversion_bloc/temp_convert_bloc.dart';
import 'weather_icon.dart';
import 'package:weather_app/utils/extensions/date_time_extensions.dart';

class ForecastWeatherWidget extends StatelessWidget {
  const ForecastWeatherWidget({
    super.key,
    required this.weatherForecastBloc,
    required this.selectedWeatherBloc,
  });

  final WeatherForecastBloc weatherForecastBloc;
  final SelectedWeatherBloc selectedWeatherBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
      bloc: weatherForecastBloc,
      builder: (context, state) {
        final items = [0, 8, 16, 24, 32];  // 3 hour interval per day for 5 days
        // if (state is WeatherLoadInProgress) {
        //   return loading();
        // } else
        if (state is WeatherLoadSuccess) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ForecastWeatherData(
              weatherDataItems: [
                for (var i in items) WeatherData.from(state.forecast.list[i]),
              ],
              selectedWeatherBloc: selectedWeatherBloc,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class ForecastWeatherData extends StatelessWidget {
  const ForecastWeatherData(
      {Key? key,
      required this.weatherDataItems,
      required this.selectedWeatherBloc})
      : super(key: key);
  final List<WeatherData> weatherDataItems;
  final SelectedWeatherBloc selectedWeatherBloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: weatherDataItems
          .map((data) => ForecastWeatherItem(
                data: data,
                selectedWeatherBloc: selectedWeatherBloc,
              ))
          .toList(),
    );
  }
}

class ForecastWeatherItem extends StatelessWidget {
  const ForecastWeatherItem(
      {Key? key, required this.data, required this.selectedWeatherBloc})
      : super(key: key);
  final WeatherData data;
  final SelectedWeatherBloc selectedWeatherBloc;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: 100,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: secondaryColor),
      child: Column(
        children: [
          getText16HeadingWidget(data.dateTime?.convertToDayAbbr() ?? "",
              context: context),
          WeatherIconImage(iconUrl: data.iconUrl, size: 64),
          BlocBuilder<TemperatureConvertBloc, TemperatureConvertState>(
              bloc: BlocProvider.of<TemperatureConvertBloc>(context),
              buildWhen: (previous, current) {
                return previous.temperatureUnits != current.temperatureUnits;
              },
              builder: (context, state) {
                return getText16Body(
                    state.temperatureUnits == TemperatureUnits.celsius
                        ? "${data.temp}°"
                        : "${data.temp.toFahrenheit().toStringAsFixed(2)}°",
                    context: context);
              }),
        ],
      ).onTap(() {
        selectedWeatherBloc
            .add(GetSelectedWeather(selectedWeatherRequested: data));
      }),
    );
  }
}
