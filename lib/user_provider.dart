import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _username = '';
  String _name = '';

  String get username => _username;
  String get name => _name;

  void setUser(String username, String name) {
    _username = username;
    _name = name;
    notifyListeners();
  }
}
