import 'package:weather_app/data/data_sources/remote/weather_api_service.dart';
import 'package:weather_app/data/models/weather_model.dart';

import '../../domain/repository/weather_repository.dart';
import '../../utils/resources/data_state.dart';
import 'base/base_repository.dart';

class WeatherRepositoryImpl extends BaseApiRepository
    implements WeatherRepository {
  WeatherApiService weatherApiService;
  WeatherRepositoryImpl({required this.weatherApiService});
  @override
  Future<DataState<WeatherModel>> getCurrentWeather(
      String lat, String lon, String apiKey, String unit) {
    return getStateOf<WeatherModel>(
      request: () => weatherApiService.getWeather(lat, lon, apiKey, unit),
    );
  }

  @override
  Future<DataState<ForecastModel>> getForecastWeather(
      String lat, String lon, String apiKey, String unit) {
    return getStateOf<ForecastModel>(
      request: () => weatherApiService.getForecast(lat, lon, apiKey, unit),
    );
  }
}
