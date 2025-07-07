part of 'temp_convert_bloc.dart';

enum TemperatureUnits { fahrenheit, celsius }

 class TemperatureConvertState {

  final TemperatureUnits temperatureUnits;

  TemperatureConvertState({required this.temperatureUnits});
}
// class TemperatureUnitInitial extends TemperatureConvertState{
//   final TemperatureUnits temperatureUnits;

//   TemperatureUnitInitial({required this.temperatureUnits});
// }
// class TemperatureConvertedUnit extends TemperatureConvertState{
//   final TemperatureUnits temperatureUnits;

//   TemperatureConvertedUnit({required this.temperatureUnits});
// }