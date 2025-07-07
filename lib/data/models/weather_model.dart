import 'package:weather_app/utils/constants/open%20weather%20api/api_constants.dart';

class ForecastModel {
  ForecastModel({
    required this.cod,
    required this.list,
  });

  final String? cod;

  final List<WeatherModel> list;

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      cod: json["cod"],
      list: json["list"] == null
          ? []
          : List<WeatherModel>.from(
              json["list"]!.map((x) => WeatherModel.fromJson(x))),
    );
  }
}

class WeatherModel {
  final int? dt;
  final Main? main;
  final List<WeatherElement> weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  // final ? pop;
  final Sys? sys;
  final DateTime? dtTxt;
  // final Rain? rain;

  WeatherModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    // required this.pop,
    required this.sys,
    required this.dtTxt,
    // required this.rain,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        dt: json["dt"],
        main: json["main"] == null ? null : Main.fromJson(json["main"]),
        weather: json["weather"] == null
            ? []
            : List<WeatherElement>.from(
                json["weather"]!.map((x) => WeatherElement.fromJson(x))),
        clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
        wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        //  pop: json["pop"],
        sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
        dtTxt: DateTime.tryParse(json["dt_txt"] ?? ""),
        //  rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main?.toJson(),
        "weather": weather.map((x) => x.toJson()).toList(),
        "clouds": clouds?.toJson(),
        "wind": wind?.toJson(),
        "visibility": visibility,
        // "pop": pop,
        "sys": sys?.toJson(),
        "dt_txt": dtTxt?.toIso8601String(),
        //  "rain": rain?.toJson(),
      };
  static String getIconUrl(String icon) =>
      "${WeatherAppConstants.iconURL}$icon${WeatherAppConstants.iconSize}";
}

class Clouds {
  final int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Coord {
  final double lon;
  final double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class WeatherElement {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherElement({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  final double speed;
  final int deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}

class Sys {
  Sys({
    required this.pod,
  });

  final String? pod;

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json["pod"],
    );
  }

  Map<String, dynamic> toJson() => {
        "pod": pod,
      };
}
