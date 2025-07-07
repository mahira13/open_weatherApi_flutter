import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/utils/models/weather_data.dart';

import '../../../../domain/usecases/get_current_weather_usecase.dart';
import '../../../../utils/constants/open weather api/api_constants.dart';
import '../../../../utils/resources/data_state.dart';

part 'selected_weather_event.dart';
part 'selected_weather_state.dart';

class SelectedWeatherBloc
    extends Bloc<WeatherSelectedEvent, WeatherSelectedState> {

  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;

  SelectedWeatherBloc({required this.getCurrentWeatherUsecase})
      : super(WeatherInitialCurrent()) {
    on<GetSelectedWeather>(weatherSelected);
    on<GetCurrentWeather>(getCurrentWeather);
    on<WeatherCurrentRefreshRequested>(weatherCurrentRefresh);
  }
  Future<void> getCurrentWeather(
    GetCurrentWeather event,
    Emitter<WeatherSelectedState> emit,
  ) async {
    emit(WeatherCurrentLoadInProgress());
    var response = await getCurrentWeatherUsecase.call(
      params: ParamsCurrentWeather(
          lat: WeatherAppConstants.latBerlin,
          lon: WeatherAppConstants.lonBerlin),
    );
    if (response is DataSuccess) {
      emit(WeatherCurrentLoadSuccess(
        currentWeather: WeatherData.from(response.data!),
      ));
    } else {
      emit(WeatherCurrentLoadFailure());
    }
  }

//////selection
  Future<void> weatherSelected(
    GetSelectedWeather event,
    Emitter emit,
  ) async {
    emit(WeatherCurrentLoadInProgress());
    emit(WeatherCurrentLoadSuccess(
        currentWeather: event.selectedWeatherRequested));
  }

  Future<void> weatherCurrentRefresh(
    WeatherCurrentRefreshRequested event,
    Emitter<WeatherSelectedState> emit,
  ) async {
    emit(WeatherCurrentLoadInProgress());
    var response = await getCurrentWeatherUsecase.call(
      params: ParamsCurrentWeather(
          lat: WeatherAppConstants.latBerlin,
          lon: WeatherAppConstants.lonBerlin),
    );
    if (response is DataSuccess) {
      emit(WeatherCurrentLoadSuccess(
          currentWeather: WeatherData.from(response.data!)));
    } else {
      emit(WeatherCurrentLoadFailure());
    }
  }
}
