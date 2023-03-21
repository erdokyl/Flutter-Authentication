import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  const StarDisplay({super.key, required this.value});
  final int value;
  @override
   Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}