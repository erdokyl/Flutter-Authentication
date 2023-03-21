import 'package:flutter/material.dart';
import '../../shop/profile/model/user_model.dart';


class UserViewModel with ChangeNotifier{

  HomeUserModel _user =HomeUserModel(name: '', surname: '', email: '', pwd: '', id: '');

  HomeUserModel get user => _user;
  
  void setUser(String user)async{
     _user = HomeUserModel.fromJson(user);
     notifyListeners();
    
  }


}