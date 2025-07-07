extension ConvertWindSpeed on double {
  String get kmh => (this * 3.6).toStringAsFixed(2);
}
extension TemperatureConversion on double {
  double toFahrenheit() => ((this * 9 / 5) + 32);
  double toCelsius() => (this - 32) * 5 / 9;
}