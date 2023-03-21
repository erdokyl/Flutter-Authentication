import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/style_constants.dart';



class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.controller, required this.hintText});
  final TextEditingController controller;

  final String hintText;
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                style:StyleConstant.instance.ts14White,
                cursorColor: ColorConstant.instance.gray,
                controller: controller,
                decoration: InputDecoration(
                  labelText:hintText ,
                  labelStyle: StyleConstant.instance.ts14,
                  fillColor: ColorConstant.instance.dark,
                    filled: true,
                   
                    focusedBorder: OutlineInputBorder(
                        
                        borderSide: BorderSide(
                            color: ColorConstant.instance.gray),
                        borderRadius: BorderRadius.circular(6)),
                    
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorConstant.instance.dark),
                        borderRadius: BorderRadius.circular(6))),
              );
  }
}