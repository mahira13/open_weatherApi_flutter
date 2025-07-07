


part of 'weather_bloc.dart';

abstract class WeatherForecastState  {
  const WeatherForecastState();


}

class WeatherInitialForecast extends WeatherForecastState {}

class WeatherLoadInProgress extends WeatherForecastState {}

class WeatherLoadSuccess extends WeatherForecastState {
  //Weather Model
  final ForecastModel forecast;

  WeatherLoadSuccess({required this.forecast}) ;

}

class WeatherLoadFailure extends WeatherForecastState {}

// class WeatherSelectedSuccess extends WeatherState {
//   //Weather Model
//   final WeatherData selectedWeatherResponse;

//   WeatherSelectedSuccess({required this.selectedWeatherResponse}) ;

// }