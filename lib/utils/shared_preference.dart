import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static saveData<V>(String key, V value) async {
    var sp = await SharedPreferences.getInstance();
    var type = value.runtimeType;
    if (type == int) {
      sp.setInt(key, value as int);
    } else if (type == double) {
      sp.setDouble(key, value as double);
    } else if (type == String) {
      sp.setString(key, value as String);
    } else if (type == bool) {
      sp.setBool(key, value as bool);
    } else if (type == List) {
      sp.setStringList(key, value as List<String>);
    } else {
      print('类型不匹配');
    }
  }

  static getData(String key) async {
    var sp = await SharedPreferences.getInstance();
    print('sp.get($key)=>${sp.get(key)}');
    return sp.get(key);
  }

  static deleteAllData() async {
    var sp = await SharedPreferences.getInstance();
    for (String key in sp.getKeys()) {
      sp.remove(key);
    }
  }

  static deleteData(String key) async {
    var sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  static containsKey(String key) async {
    var sp = await SharedPreferences.getInstance();
    return sp.containsKey(key);
  }

  static clear() async {
    var sp = await SharedPreferences.getInstance();
    await sp.clear();
  }
}
