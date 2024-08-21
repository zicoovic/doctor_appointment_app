import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor as i don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with given [key].
  static removeData(String key) async {
    debugPrint('SharedPrefHelper: removeData($key)');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  /// Remove all keys and values in the SharedPreferences
  static clearAllData() async {
    debugPrint('SharedPrefHelper: clearAllData()');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  /// save a [Value] with a [key]  in the sharedPreferences
  static setData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: setData($key, $value)');
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value);
        break;
      case int:
        await sharedPreferences.setInt(key, value);
        break;
      case double:
        await sharedPreferences.setDouble(key, value);
        break;
      case bool:
        await sharedPreferences.setBool(key, value);
        break;
      default:
        return null;
    }
  }

  /// Gets a bool value from sharedPreferences with given [key].

  static getBool(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: getBool($key)');
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets an int value from SharedPreferences with given [key].

  static getInt(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: getInt($key)');
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets a double value from SharedPreferences with given [key].

  static getDouble(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: getDouble($key)');
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets a String value from SharedPreferences with given [key].

  static getString(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint('SharedPrefHelper: getString($key)');
    return sharedPreferences.getString(key) ?? '';
  }
}
