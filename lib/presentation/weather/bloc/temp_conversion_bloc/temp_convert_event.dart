part of 'temp_convert_bloc.dart';
abstract class TemperatureConvertEvent {}

class TemperatureUnitToggled extends TemperatureConvertEvent {
  TemperatureUnits  temperatureUnits;

  TemperatureUnitToggled({required this.temperatureUnits});
}

class TemoperatureUnitReset extends TemperatureConvertEvent{}