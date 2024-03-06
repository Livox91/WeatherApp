import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  static const String firstTime = "key";

  Future<bool> isFirstTimeUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(firstTime) ?? true;
  }

  Future<void> markSetupCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(firstTime, false);
  }
}
