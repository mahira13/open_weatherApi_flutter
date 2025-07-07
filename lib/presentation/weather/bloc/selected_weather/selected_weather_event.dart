part of 'selected_weather_bloc.dart';

abstract class WeatherSelectedEvent {
  const WeatherSelectedEvent();
}
class GetCurrentWeather extends WeatherSelectedEvent {
 
}

class WeatherCurrentRefreshRequested extends WeatherSelectedEvent {
 
}

class GetSelectedWeather extends WeatherSelectedEvent {

  WeatherData selectedWeatherRequested;

   GetSelectedWeather({required this.selectedWeatherRequested});
}