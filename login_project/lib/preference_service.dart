import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static PreferenceService _instance;
  static SharedPreferences _prefs;

  PreferenceService._();

  factory PreferenceService() {
    if (_instance == null) {
      SharedPreferences.getInstance().then((prefs) {
        _prefs = prefs;
      });
      _instance = PreferenceService._();
    }
    return _instance;
  }

  set email(String value) => _prefs.setString('USER_EMAIL', value);

  String get email => _prefs.getString('USER_EMAIL');
}
