import '../../data/models/weather_model.dart';

class WeatherData {
  final double temp;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final String description;

  final String iconUrl;
  DateTime? dateTime;
  String? name;

  @override
  String toString() {
    name ??= "";
    return "$name temp=${temp.toStringAsFixed(1)}, descprition=$description";
  }

  WeatherData({
    required this.temp,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.description,
    required this.iconUrl,
    this.dateTime,
    this.name,
  });

  factory WeatherData.from(WeatherModel weather) {
    String iconUrl = WeatherModel.getIconUrl(weather.weather[0].icon);
    return WeatherData(
      temp: weather.main?.temp??0,
      humidity: weather.main?.humidity??0,
      pressure: weather.main?.pressure??0,
      windSpeed: weather.wind?.speed??0,
      description: weather.weather[0].description,
      dateTime: DateTime.fromMillisecondsSinceEpoch(weather.dt! * 1000),
      iconUrl: iconUrl,
      name: weather.weather[0].main,
    );
  }
}
