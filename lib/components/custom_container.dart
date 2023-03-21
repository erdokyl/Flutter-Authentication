import 'package:auth_op/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;
  @override
 Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorConstant.instance.white,borderRadius: BorderRadius.circular(36)),
      width: 100,
      height: 30,
      child: child,
    );
  }
}