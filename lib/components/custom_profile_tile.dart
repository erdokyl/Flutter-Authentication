
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../constants/style_constants.dart';


class CustomProfileTile extends StatelessWidget {
  const CustomProfileTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onPress});

  final String title, subTitle;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        
        title: Text(title,style: StyleConstant.instance.ts16bold,),
        subtitle: Text(subTitle,style:StyleConstant.instance.ts12),
        onTap: onPress,
        trailing: Icon(Icons.chevron_right,color:ColorConstant.instance.gray),
      ),
    );
  }
}
