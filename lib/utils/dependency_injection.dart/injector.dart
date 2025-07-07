import 'package:get_it/get_it.dart';
import 'package:weather_app/data/data_sources/remote/weather_api_service.dart';
import 'package:weather_app/data/repository/weather_repository_impl.dart';
import 'package:weather_app/domain/usecases/get_current_weather_usecase.dart';
import 'package:weather_app/presentation/weather/bloc/forecast_weather/weather_bloc.dart';
import 'package:dio/dio.dart';

import '../../domain/usecases/get_forecast_weather_usecase.dart';
import '../../presentation/weather/bloc/selected_weather/selected_weather_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerFactory(
    () => WeatherForecastBloc(
      getWeatherForecastUsecase: getIt<GetWeatherForecastUsecase>(),
    ),
  );
  getIt.registerFactory(
    () => SelectedWeatherBloc(
      getCurrentWeatherUsecase: getIt<GetCurrentWeatherUsecase>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetWeatherForecastUsecase(
      expenseRepository: getIt<WeatherRepositoryImpl>(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetCurrentWeatherUsecase(
      expenseRepository: getIt<WeatherRepositoryImpl>(),
    ),
  );
  getIt.registerLazySingleton(
    () => WeatherRepositoryImpl(weatherApiService: getIt<WeatherApiService>()),
  );
  getIt.registerLazySingleton(
    () => WeatherApiService(getIt<Dio>()),
  );

  // getIt.registerSingleton<WeatherApiService>(() =>WeatherApiService(getIt<Dio>()));
  getIt.registerLazySingleton(() => Dio());
}
