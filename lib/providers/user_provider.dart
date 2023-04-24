import 'package:flutter/material.dart';
import 'package:project_s4/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: "",
    name: "",
    email: "",
    password: "",
    address: "",
    type: "",
    user: "",
    token: "",
    verified: 0,
    phone: 0,
    cart: [],
  );

  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
