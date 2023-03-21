import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  bool isLoginPage = true;
  bool isPwdEnable = true;

  void changePage(){
    isLoginPage = !isLoginPage;
    notifyListeners();
  }

  void changePwdEnable(){
    isPwdEnable = !isPwdEnable;
    notifyListeners();
  }
}