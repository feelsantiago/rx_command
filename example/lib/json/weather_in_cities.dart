class WeatherInCities {
  final int cod;
  final double calctime;
  final int cnt;
  final List<City> cities;

  WeatherInCities(
    this.cod,
    this.calctime,
    this.cnt,
    this.cities,
  );

  factory WeatherInCities.fromJson(Map<String, dynamic> json) => WeatherInCities(
        json["cod"] as int,
        json["calctime"] as double,
        json["cnt"] as int,
        List<City>.from(
            (json["list"] as List).map((x) => City.fromJson(x as Map<String, dynamic>)).toList()),
      );

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "calctime": calctime,
        "cnt": cnt,
        "list": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  City(
    this.id,
    this.dt,
    this.name,
    this.coord,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.snow,
    this.clouds,
    this.weather,
  );

  final int id;
  final int dt;
  final String name;
  final Coord coord;
  final MainClass main;
  final int visibility;
  final Wind wind;
  final dynamic rain;
  final dynamic snow;
  final Clouds clouds;
  final List<Weather> weather;

  factory City.fromJson(Map<String, dynamic> json) => City(
        json["id"] as int,
        json["dt"] as int,
        json["name"] as String,
        Coord.fromJson(json["coord"] as Map<String, dynamic>),
        MainClass.fromJson(json["main"] as Map<String, dynamic>),
        json["visibility"] == null ? 0 : json["visibility"] as int,
        Wind.fromJson(json["wind"] as Map<String, dynamic>),
        json["rain"],
        json["snow"],
        Clouds.fromJson(json["clouds"] as Map<String, dynamic>),
        List<Weather>.from(
            (json["weather"] as List).map((x) => Weather.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dt": dt,
        "name": name,
        "coord": coord.toJson(),
        "main": main.toJson(),
        "visibility": visibility == null ? 0 : visibility,
        "wind": wind.toJson(),
        "rain": rain,
        "snow": snow,
        "clouds": clouds.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
      };
}

class Clouds {
  Clouds(
    this.today,
  );

  final int today;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        json["today"] as int,
      );

  Map<String, dynamic> toJson() => {
        "today": today,
      };
}

class Coord {
  Coord(
    this.lon,
    this.lat,
  );

  final double lon;
  final double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        (json["Lon"] as num).toDouble(),
        (json["Lat"] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Lon": lon,
        "Lat": lat,
      };
}

class MainClass {
  MainClass(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  );

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        (json["temp"] as num).toDouble(),
        (json["feels_like"] as num).toDouble(),
        (json["temp_min"] as num).toDouble(),
        (json["temp_max"] as num).toDouble(),
        json["pressure"] as int,
        json["humidity"] as int,
        json["sea_level"] == null ? 0 : json["sea_level"] as int,
        json["grnd_level"] == null ? 0 : json["grnd_level"] as int,
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel == null ? 0 : seaLevel,
        "grnd_level": grndLevel == null ? 0 : grndLevel,
      };
}

class Weather {
  Weather(
    this.id,
    this.main,
    this.description,
    this.icon,
  );

  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        json["id"] as int,
        json["main"] as String,
        json["description"] as String,
        json["icon"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  Wind(
    this.speed,
    this.deg,
  );

  final double speed;
  final int deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        json["speed"] as double,
        json["deg"] as int,
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}
