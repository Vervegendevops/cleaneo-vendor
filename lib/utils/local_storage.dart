import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';


class LocalStorage{

  static const String _userKey = 'user';

// Save user data
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

// Get user data
  Future<User?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(_userKey);
    if (userJson == null) {
      return null;
    }
    Map<String, dynamic> userMap = jsonDecode(userJson);
    return User.fromJson(userMap);
  }

// Delete user data
  Future<void> deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  static Future<void> saveUserID(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ID', token);
  }

  static Future<String> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('ID')??'';
  }

  static Future<void> saveRegisteration(String register) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('register', register);
  }

  static Future<String> getRegisteration() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('register')??'';
  }
}

