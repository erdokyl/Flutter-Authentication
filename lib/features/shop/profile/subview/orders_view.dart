import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/padding_constant.dart';
import '../../../../constants/style_constants.dart';


class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(actions: [Padding(
                      padding: PaddingConstant.instance.right16,
                      child: Icon(
                        Icons.search,
                        color: ColorConstant.instance.white,
                        size: 32,
                      ),
                    )],),
      body: ListView.builder(shrinkWrap: true,itemCount: 1,itemBuilder: (context,index){
        return ListTile(title: Text("AAAAAA",style: StyleConstant.instance.ts14White,),);
      }),
    );
  }
}