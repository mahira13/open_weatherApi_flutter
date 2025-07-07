


part of 'selected_weather_bloc.dart';

abstract class WeatherSelectedState  {
  const WeatherSelectedState();


}

class WeatherInitialCurrent extends WeatherSelectedState {}

class WeatherCurrentLoadInProgress extends WeatherSelectedState {}

class WeatherCurrentLoadSuccess extends WeatherSelectedState {
  //Weather Model
   final WeatherData? currentWeather;

  WeatherCurrentLoadSuccess({required this.currentWeather}) ;

}

class WeatherCurrentLoadFailure extends WeatherSelectedState {}
/*class WeatherSelectedSuccess extends WeatherSelectedState {
  //Weather Model
  final WeatherData? selectedWeatherResponse;

  WeatherSelectedSuccess({required this.selectedWeatherResponse}) ;

}*/