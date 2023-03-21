import 'dart:convert';

import 'package:auth_op/features/auth/service/http_error.dart';
import 'package:auth_op/features/shop/home_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utility/helper.dart';
import '../model/user_model.dart';
import '../viewmodel/user_view_model.dart';

class AuthService{
  var uri = "<your uri>";
  void login({required BuildContext context,
      required String pwd,
      required String email}) async{
        
        try{
        http.Response loginRes = await http.post(
        Uri.parse("$uri/auth/login"),
        body: jsonEncode({'email': email, 'pwd': pwd}),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',});

        
        HttpError().getError(res: loginRes, context: context, onSuccess: ()async{
          http.Response verifyRes = await http.get(Uri.parse("$uri/auth/verify"),headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'user-id': jsonDecode(loginRes.body)['user_id'],
            'x-auth-token':jsonDecode(loginRes.body)['token']
          });

          if (verifyRes.statusCode == 200){
            showSnackBar(res: loginRes, context: context, text: "Login Successful");

            SharedPreferences preferences = await SharedPreferences.getInstance();
            preferences.setString("user",verifyRes.body);

           Provider.of<UserViewModel>(context,listen: false).setUser(verifyRes.body);

            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeView(),),(route) => false);

          }
          else{
            showSnackBar(res: loginRes, context: context, text: jsonDecode(verifyRes.body)['error']);

          }


        });
        }
        catch(err){
          print(err);
        }

      }

    void register({required BuildContext context,
      required String name,
      required String surname,
      required String pwd,
      required String re_pwd,
      required String email}) async{

        try{
        UserModel user =UserModel(name: name,surname: surname, pwd: pwd,re_pwd: re_pwd, email: email);
        http.Response registerRes = await http.post(

        Uri.parse("$uri/auth/register"),
        body: user.toJson(),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',});

         
        HttpError().getError(res: registerRes, context: context, onSuccess: (){
            showSnackBar(res: registerRes, context: context,text: "Register successful");
        });
       
        }
        catch(err){
          print(err);
        }
      }
}