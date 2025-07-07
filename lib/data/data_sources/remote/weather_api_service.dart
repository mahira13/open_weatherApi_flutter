import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/data/models/weather_model.dart';

import '../../../utils/constants/open weather api/api_constants.dart';
part 'weather_api_service.g.dart';
@RestApi(baseUrl: WeatherAppConstants.baseURL)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio) = _WeatherApiService;

  @GET('/weather')  //to get current weather data
   Future<HttpResponse<WeatherModel>> getWeather(
    @Query('lat') String lat,
    @Query('lon') String lon,
    @Query('appid') String apiKey,
    @Query('units') String unit,
  );

  @GET('/forecast')  // to get 5 day weather forecast data
  Future<HttpResponse<ForecastModel>> getForecast(
    @Query('lat') String lat,
    @Query('lon') String lon,
    @Query('appid') String apiKey,
    @Query('units') String unit,
  );
}  

