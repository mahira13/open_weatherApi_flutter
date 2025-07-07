import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/weather/bloc/forecast_weather/weather_bloc.dart';
import 'package:weather_app/presentation/weather/bloc/temp_conversion_bloc/temp_convert_bloc.dart';
import 'package:weather_app/utils/constants/app_colors.dart';
import 'package:weather_app/utils/extensions/date_time_extensions.dart';
import 'package:weather_app/utils/extensions/double_extensions.dart';
import 'package:weather_app/utils/extensions/widget_extensions.dart';
import 'package:weather_app/utils/models/weather_data.dart';

import '../../../../utils/common_widgets.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../bloc/selected_weather/selected_weather_bloc.dart';
import 'weather_icon.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final SelectedWeatherBloc selectedWeatherBloc;
  final WeatherForecastBloc weatherForecastBloc;
  const CurrentWeatherWidget({
    required this.selectedWeatherBloc,
    super.key,
    required this.weatherForecastBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedWeatherBloc, WeatherSelectedState>(
      bloc: selectedWeatherBloc,
      builder: (context, state) {
        if (state is WeatherCurrentLoadInProgress) {
          return loading(content: loadingContent);
        } else if (state is WeatherCurrentLoadSuccess) {
          return weatherDataWidget(state.currentWeather, context);
        } else {
          return Center(
            child: Column(
              children: [
                getText16HeadingWidget(somethingWrong, context: context)
                    .paddingBottom(24),
                getElevatedButton(retryButtonText, onPressed: () {
                  selectedWeatherBloc.add(WeatherCurrentRefreshRequested());
                  weatherForecastBloc.add(WeatherForecastRefreshRequested());
                  // BlocProvider.of<TemperatureConvertBloc>(context)
                  //     .add(TemoperatureUnitReset());
                }, context: context),
              ],
            ).paddingSymmetricExtension(horizontal: 24, vertical: 200),
          );
        }
      },
    );
  }
}

Widget weatherDataWidget(WeatherData? weather, BuildContext context) {
  final tempBloc = BlocProvider.of<TemperatureConvertBloc>(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: getText20HeadingWidget(weather?.dateTime?.convertToDay() ?? "",
                context: context)
            .paddingTop(16),
      ),
      ListTile(
        title: getText18HeadingWidget(
          weather?.name ?? "",
          context: context,
        ),
        subtitle: getText16Body(
          weather?.description ?? "",
          context: context,
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: secondaryColor),
        child: WeatherIconImage(
          iconUrl: weather?.iconUrl ?? "",
          size: 150,
        ),
      ),
      BlocBuilder<TemperatureConvertBloc, TemperatureConvertState>(
          bloc: tempBloc,
          buildWhen: (previous, current) {
            return previous.temperatureUnits != current.temperatureUnits;
          },
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.temperatureUnits == TemperatureUnits.celsius
                      ? "${weather?.temp}"
                      : "${weather?.temp.toFahrenheit().toStringAsFixed(2)}",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: primaryColor),
                ).paddingRight(16),
                Text(
                  celcius,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: state.temperatureUnits == TemperatureUnits.celsius
                          ? primaryColor
                          : hintTextColor),
                ).onTap(() {
                  tempBloc.add(TemperatureUnitToggled(
                      temperatureUnits: TemperatureUnits.celsius));
                }),
                getText24HeadingWidget(" | ", context: context),
                Text(
                  fahrenheit,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color:
                          state.temperatureUnits == TemperatureUnits.fahrenheit
                              ? primaryColor
                              : hintTextColor),
                ).onTap(() {
                  tempBloc.add(TemperatureUnitToggled(
                      temperatureUnits: TemperatureUnits.fahrenheit));
                }),
              ],
            ).paddingSymmetricExtension(vertical: 16);
          }),
      getText16Body("$humidity : ${weather?.humidity}%", context: context)
          .paddingOnlyExtension(
        left: 16,
      ),
      getText16Body("$pressure : ${weather?.pressure} hPa", context: context)
          .paddingOnlyExtension(left: 16, bottom: 6, top: 6),
      getText16Body("$wind : ${weather?.windSpeed.kmh} Km/h", context: context)
          .paddingOnlyExtension(left: 16, bottom: 16),
    ],
  );
}
