import 'package:auth_op/constants/color_constants.dart';
import 'package:flutter/material.dart';

class StyleConstant {
  static StyleConstant instance = StyleConstant._init();
  StyleConstant._init();

  final bsPrimary = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(ColorConstant.instance.primary),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(36))));

  final ts30bold = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: ColorConstant.instance.white);
  final ts36bold = TextStyle(fontWeight: FontWeight.w600, fontSize: 36,color: ColorConstant.instance.white);
  final ts18bold = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: ColorConstant.instance.white);
  final ts16bold = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: ColorConstant.instance.white);
  final ts14bold = TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: ColorConstant.instance.gray);
  final ts14 = TextStyle(fontSize: 14, color: ColorConstant.instance.gray,decoration: TextDecoration.none);
  final ts12 = TextStyle(fontSize: 12, color: ColorConstant.instance.gray);
  final ts11Gray = TextStyle(fontSize: 11,color: ColorConstant.instance.gray,decoration: TextDecoration.none);
  final ts11White = TextStyle(fontSize: 11,color: ColorConstant.instance.white,decoration: TextDecoration.none);
  final ts14White = TextStyle(fontSize: 14,color: ColorConstant.instance.white,decoration: TextDecoration.none);
  final ts16White = TextStyle(fontSize: 16,color: ColorConstant.instance.white,decoration: TextDecoration.none);
  final ts18White = TextStyle(fontSize: 18,color: ColorConstant.instance.white,decoration: TextDecoration.none);
  final ts14Dark = TextStyle(fontSize: 14,color: ColorConstant.instance.dark,decoration: TextDecoration.none);
}
