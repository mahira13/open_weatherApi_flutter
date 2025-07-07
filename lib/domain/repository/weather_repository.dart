import 'package:weather_app/data/models/weather_model.dart';

import '../../utils/resources/data_state.dart';


abstract class WeatherRepository {
 Future<DataState<WeatherModel>> getCurrentWeather(String lat, String lon, String apiKey, String unit);
 Future<DataState<ForecastModel>> getForecastWeather(String lat, String lon, String apiKey, String unit);
}
