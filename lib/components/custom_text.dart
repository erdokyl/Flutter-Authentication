import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.data, required this.style});
  final String data;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Text(data,style: style,);
  }
}