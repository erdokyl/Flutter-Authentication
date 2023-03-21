import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../../utility/helper.dart';

class HttpError{


  void getError({required Response res , required BuildContext context, required VoidCallback onSuccess}){
      switch (res.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(res:res,context:context,text:jsonDecode(res.body)['error']);
      break;
    case 500:
      showSnackBar(res:res,context:context,text: jsonDecode(res.body)['error']);
      break;
    default:
      showSnackBar(res:res,context:context,text:res.body);
  }
  }
}