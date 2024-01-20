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
}

class CurrentTime {
  DateTime sunrise;
  DateTime sunset;

  CurrentTime({required this.sunrise, required this.sunset});
}

class Weather {
  final CurrentWeather weatherDetails;
  final Location locationDetail;
  final CurrentTime time;

  Weather(
      {required this.locationDetail,
      required this.time,
      required this.weatherDetails});
}
