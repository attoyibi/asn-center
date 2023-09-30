// Buat class Provider untuk menyediakan data pengguna
import 'package:asn_center/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider with ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  // Fungsi untuk memuat data pengguna dari local storage
  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final email = prefs.getString('email');

    if (name != null && email != null) {
      _userData = UserData(name, email);
      notifyListeners();
    }
  }

  // Fungsi untuk menyimpan data pengguna ke local storage
  Future<void> saveUserData(String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);

    _userData = UserData(name, email);
    notifyListeners();
  }
}
