import 'dart:convert';

import 'package:flutter_application_1/domain/entities/city_country.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesApi {
  //Key For First Time Setup
  static const String firstTime = "key";
  // List of Countries/Cities/bools
  static Map<CityCountry, bool> citiesCountriesMap = {
    CityCountry("Islamabad", "Pakistan"): false,
    CityCountry("Karachi", "Pakistan"): false,
    CityCountry("Multan", "Pakistan"): false,
    CityCountry("Mumbai", "India"): false,
    CityCountry("Dehli", "India"): false,
    CityCountry("Kabul", "Aghanistan"): false,
    CityCountry("Ghazni", "Afghanistan"): false,
  };
  //Function For First Time
  Future<bool> isFirstTimeUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(firstTime) ?? true;
  }

  // Function to Complete Setup / Process
  Future<void> markSetupCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> cityCountriesMapJson = {};
    // Creating CityCountries To String to store them.
    citiesCountriesMap.forEach((key, value) {
      cityCountriesMapJson[key.toJson().toString()] = value;
    });
    String cityCountry = json.encode(cityCountriesMapJson);
    await prefs.setString('citiesCountriesMap', cityCountry);
    await prefs.setBool(firstTime, false);
  }

  //Update Function For CitiesCountriesMap
  Future<void> saveCitiesCountriesStateToSharedPref(
      Map<CityCountry, bool> citiesCountries) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> cityCountriesMapJson = {};
    // Creating CityCountries To String to store them.
    citiesCountries.forEach((key, value) {
      cityCountriesMapJson[key.toJson().toString()] = value;
    });
    String citiesCountriesMapJsonString = json.encode(cityCountriesMapJson);
    await prefs.setString('citiesCountriesMap', citiesCountriesMapJsonString);
  }

  // Converts JSON to Map
  Future<Map<CityCountry, bool>> getCityCountry() async {
    final prefs = await SharedPreferences.getInstance();
    String checkboxStateJson = prefs.getString('citiesCountriesMap') ?? '';

    if (checkboxStateJson.isNotEmpty) {
      Map<CityCountry, bool> map = {};
      Map<String, dynamic> jsonMap = json.decode(checkboxStateJson);

      jsonMap.forEach(
        (key, value) {
          // Parse the string representation of the key into a Map
          Map<String, dynamic> cityCountryJson = _parseStringToMap(key);
          // Assuming CityCountry has a constructor that takes a Map<String, dynamic>
          CityCountry cityCountry = CityCountry.fromJson(cityCountryJson);
          map[cityCountry] = value;
        },
      );
      return map;
    } else {
      return {};
    }
  }

  Map<String, dynamic> _parseStringToMap(String input) {
    Map<String, dynamic> result = {};
    // Remove the curly braces from the string
    String cleanedInput = input.substring(1, input.length - 1);
    // Split the string by commas to separate key-value pairs
    List<String> pairs = cleanedInput.split(', ');
    // Iterate over the pairs and parse them into key-value entries
    for (var pair in pairs) {
      List<String> keyValue = pair.split(': ');
      String key = keyValue[0].trim();
      String value = keyValue[1].trim();
      // Add the parsed key-value pair to the result map
      result[key] = value;
    }
    return result;
  }
}
