class CurrentWeather {
  int temperature;
  int humidity;
  double windSpeed;
  String condition;

  CurrentWeather({
    required this.condition,
    required this.humidity,
    required this.temperature,
    required this.windSpeed,
  });

  factory CurrentWeather.empty() {
    return CurrentWeather(
        condition: "", humidity: 0, temperature: 0, windSpeed: 0.0);
  }
}

class Location {
  double latitude;
  double longitude;
  String city;
  String country;

  Location(
      {required this.latitude,
      required this.longitude,
      required this.city,
      required this.country});

  factory Location.empty() {
    return Location(latitude: 0.0, longitude: 0.0, city: "", country: "");
  }
}

class CurrentTime {
  DateTime sunrise;
  DateTime sunset;

  CurrentTime({required this.sunrise, required this.sunset});

  factory CurrentTime.empty() {
    return CurrentTime(sunrise: DateTime(0), sunset: DateTime(0));
  }
}

class Weather {
  final CurrentWeather weatherDetails;
  final Location locationDetail;
  final CurrentTime time;

  Weather(
      {required this.locationDetail,
      required this.time,
      required this.weatherDetails});

  factory Weather.empty() {
    return Weather(
        locationDetail: Location.empty(),
        time: CurrentTime.empty(),
        weatherDetails: CurrentWeather.empty());
  }
}
