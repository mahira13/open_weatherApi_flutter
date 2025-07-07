import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'temp_convert_event.dart';
part 'temp_convert_state.dart';

class TemperatureConvertBloc
    extends Bloc<TemperatureConvertEvent, TemperatureConvertState> {
  TemperatureConvertBloc()
      : super(TemperatureConvertState(
            temperatureUnits: TemperatureUnits.celsius)) {
    on<TemperatureUnitToggled>(tempUnitToggle);
    on<TemoperatureUnitReset>(tempUnitResetToCelcius);
  }
  Future<void> tempUnitToggle(
    TemperatureUnitToggled event,
    Emitter<TemperatureConvertState> emit,
  ) async {
    emit(TemperatureConvertState(temperatureUnits: event.temperatureUnits));
  }

  Future<void> tempUnitResetToCelcius(
    TemoperatureUnitReset event,
    Emitter<TemperatureConvertState> emit,
  ) async {
    print(event);
    emit(TemperatureConvertState(temperatureUnits: TemperatureUnits.celsius));
  }
}
