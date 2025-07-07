import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/utils/constants/open%20weather%20api/api_constants.dart';
import 'package:weather_app/utils/resources/data_state.dart';

import '../../utils/usecase/usecase.dart' show UseCase;

import '../repository/weather_repository.dart';

class GetCurrentWeatherUsecase implements UseCase<WeatherModel, ParamsCurrentWeather> {
  final WeatherRepository expenseRepository;
  GetCurrentWeatherUsecase({required this.expenseRepository});
  @override
  Future<DataState<WeatherModel>> call({ParamsCurrentWeather? params}) {
    return expenseRepository.getCurrentWeather(
      params!.lat,
      params.lon,
      params.apiKey,
      params.unit
    );
  }
}

class ParamsCurrentWeather {
  String lat = "";
  String lon = "";
  final String apiKey = WeatherAppConstants.apiKey;
  final String unit = WeatherAppConstants.unit;

  ParamsCurrentWeather({required this.lat, required this.lon});
}
