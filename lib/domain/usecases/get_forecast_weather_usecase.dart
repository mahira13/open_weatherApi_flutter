import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/utils/constants/open%20weather%20api/api_constants.dart';
import 'package:weather_app/utils/resources/data_state.dart';

import '../../utils/usecase/usecase.dart' show UseCase;

import '../repository/weather_repository.dart';

class GetWeatherForecastUsecase implements UseCase<ForecastModel, ParamsForecastWeather> {
  final WeatherRepository expenseRepository;
  GetWeatherForecastUsecase({required this.expenseRepository});
  @override
  Future<DataState<ForecastModel>> call({ParamsForecastWeather? params}) {
    return expenseRepository.getForecastWeather(
      params!.lat,
      params.lon,
      params.apiKey,
      params.unit
    );
  }
}

class ParamsForecastWeather {
  String lat = "";
  String lon = "";
  final String apiKey = WeatherAppConstants.apiKey;
  final String unit = WeatherAppConstants.unit;

  ParamsForecastWeather({required this.lat, required this.lon});
}
