import 'package:flutter/material.dart';

class ColorConstant{
  static ColorConstant instance = ColorConstant._init();
  ColorConstant._init();
  
  final white =const Color(0xFFF6F6F6);
  final gray =const Color(0xFFABB4BD);
  final primary =const Color(0xFFEF3651);
  final background =const Color(0xFF1e1f28);
  final dark =const Color(0xFF2A2C36);
  final sale =const Color(0xFFFF3E3E);
  final error =const Color(0xFFFF2424);
  final success =const Color(0xFF55D85A);

}