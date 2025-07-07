part of 'weather_bloc.dart';

abstract class WeatherForecastEvent {
  const WeatherForecastEvent();
}

class GetWeatherForecastEvent extends WeatherForecastEvent {
  // GetWeatherForecastEvent();
}

class WeatherForecastRefreshRequested extends WeatherForecastEvent {}
