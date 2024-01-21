import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherAPI {
  Future<Map<String, dynamic>> getWeatherData(city, country) async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city,$country&APPID=e12acf0be09c4d48e8234f5745955111&units=metric"));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("failed to load data");
    }
  }
}
