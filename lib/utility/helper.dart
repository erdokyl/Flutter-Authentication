import 'package:auth_op/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void showSnackBar({required Response res ,required BuildContext context,required String text}) {
  Color? errorColor;
  if (res.statusCode == 200) {
    errorColor = ColorConstant.instance.success;
  }
  
  else if (res.statusCode == 400) {

  errorColor = ColorConstant.instance.error;
  }
    
    

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: errorColor!,content: Text(text)));
}
