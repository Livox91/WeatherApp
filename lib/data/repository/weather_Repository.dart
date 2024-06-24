import 'package:flutter_application_1/domain/entities/weather.dart';
import '../data_source/weather_api.dart';

class WeatherRepository {
  static Future<Weather> getWeatherData(
      {String? city = "Karachi", String? country = "pk"}) async {
    final APIData = await WeatherAPI().getWeatherData(city, country);

    var weatherDet = APIData['main'];
    final windSpeed = APIData['wind']['speed'];
    final conditions = APIData['weather'][0]['main'];

    final weatherDetail = CurrentWeather(
        condition: conditions,
        humidity: weatherDet['humidity'].toInt(),
        temperature: weatherDet['temp'].toInt(),
        windSpeed: windSpeed.toDouble());

    final locationDet = APIData['coord'];

    final LocationDetail = Location(
        latitude: locationDet['lat'],
        longitude: locationDet['lon'],
        city: APIData['name'],
        country: APIData['sys']['country']);

    DateTime sunrise = DateTime.fromMillisecondsSinceEpoch(
        (APIData['sys']['sunrise'] + APIData['timezone']) * 1000);
    sunrise = sunrise.subtract(const Duration(hours: 5));

    DateTime sunset = DateTime.fromMillisecondsSinceEpoch(
        (APIData['sys']['sunset'] + APIData['timezone']) * 1000);
    sunset = sunset.subtract(const Duration(hours: 5));

    final TimeDetail = CurrentTime(
      sunrise: sunrise,
      sunset: sunset,
    );

    return Weather(
        locationDetail: LocationDetail,
        time: TimeDetail,
        weatherDetails: weatherDetail);
  }
}
