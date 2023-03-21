import 'package:flutter/material.dart';

class PaddingConstant {
  static PaddingConstant instance = PaddingConstant._init();
  PaddingConstant._init();

  final top2 = const EdgeInsets.only(top: 2);
  final top6 = const EdgeInsets.only(top:6.0);
  final left10 = const EdgeInsets.only(left :10);
  final left24 = const EdgeInsets.only(left :24);
  final right16 = const EdgeInsets.only(right: 16);
  final hori12 = const EdgeInsets.symmetric(horizontal: 12);
  final hori10 = const EdgeInsets.symmetric(horizontal: 10);
  final tlr10 = const  EdgeInsets.only(top: 10, left: 10, right: 10);
}