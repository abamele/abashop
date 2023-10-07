import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/user-model.dart';

class AuthNotifier extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  Users _userDetails= Users();
  Users get userDetails => _userDetails;

  void setUserDetails(Users users) {
    _userDetails = users;
    notifyListeners();
  }
}