import 'package:flutter/material.dart';

import '../constants/style_constants.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPress, required this.child});
  final VoidCallback onPress;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width:343,
      child: ElevatedButton(onPressed: onPress, child: child,style: StyleConstant.instance.bsPrimary));
  }
}