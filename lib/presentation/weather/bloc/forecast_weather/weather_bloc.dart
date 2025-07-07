import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/utils/constants/open%20weather%20api/api_constants.dart';

import 'package:weather_app/utils/resources/data_state.dart';

import 'package:weather_app/data/models/weather_model.dart';

import '../../../../domain/usecases/get_forecast_weather_usecase.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherForecastBloc extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  final GetWeatherForecastUsecase getWeatherForecastUsecase;
  WeatherForecastBloc({required this.getWeatherForecastUsecase})
      : super(WeatherInitialForecast()) {
    on<GetWeatherForecastEvent>(getWeatherForecast);
    on<WeatherForecastRefreshRequested>(weatherForecastRefresh);
  
  }

  Future<void> getWeatherForecast(
    GetWeatherForecastEvent event,
    Emitter<WeatherForecastState> emit,
  ) async {
    emit(WeatherLoadInProgress());
    var response = await getWeatherForecastUsecase.call(
      params: ParamsForecastWeather(lat: WeatherAppConstants.latBerlin, lon: WeatherAppConstants.lonBerlin),
    );
    if (response is DataSuccess) {
 
      emit(WeatherLoadSuccess(forecast: response.data!));
    } else {
      emit(WeatherLoadFailure());
    }
  }

  Future<void> weatherForecastRefresh(
    WeatherForecastRefreshRequested event,
    Emitter<WeatherForecastState> emit,
  ) async {
    emit(WeatherLoadInProgress());
    var response = await getWeatherForecastUsecase.call(
      params: ParamsForecastWeather(lat: WeatherAppConstants.latBerlin, lon: WeatherAppConstants.lonBerlin),  //berl
    );
    if (response is DataSuccess) {
      emit(WeatherLoadSuccess(forecast: response.data!));
    } else {
      emit(WeatherLoadFailure());
    }
  }


}
