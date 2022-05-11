import 'dart:convert';

import 'package:flutter_job_one/service/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String valueSharedPrefrences = 'user';

// Write DATA
  static Future<bool> saveUserData(User value) async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    String user = jsonEncode(User.fromJson(value.toJson()));
    return shared_User.setString(valueSharedPrefrences, user);
  }

// Read Data
  static Future<User> getUserData() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap =
        jsonDecode(shared_User.getString(valueSharedPrefrences) as String);
    var user = User.fromJson(userMap);
    return user;
  }

// Clear
  static void clearData() async {
    SharedPreferences shared_User = await SharedPreferences.getInstance();
    await shared_User.remove(valueSharedPrefrences);
  }
}
