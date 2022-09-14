
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themeproj/utils/app_strings.dart';


class SharedPreference {
  static SharedPreference? _sharedPreferenceHelper;
  static SharedPreferences? _sharedPreferences;

  SharedPreference._createInstance();

  factory SharedPreference() {
    // factory with constructor, return some value
    if (_sharedPreferenceHelper == null) {
      _sharedPreferenceHelper = SharedPreference
          ._createInstance(); // This is executed only once, singleton object
    }
    return _sharedPreferenceHelper!;
  }

  Future<SharedPreferences> get sharedPreference async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _sharedPreferences!;
  }

  ////////////////////// Clear Preference ///////////////////////////
  void clear() {
    _sharedPreferences!.clear();
  }

  ////////////////////// Bearer Token ///////////////////////////
  //
  void setBearerToken({String? token}) {
    _sharedPreferences!.setString(AppStrings.BEARER_TOKEN_KEY, token ?? "");
  }

  String? getBearerToken() {
    return _sharedPreferences!.getString(AppStrings.BEARER_TOKEN_KEY);
  }










}
