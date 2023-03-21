import 'package:flutter/material.dart';

import '../../../../components/custom_button.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/padding_constant.dart';
import '../../../../constants/style_constants.dart';



class BagView extends StatefulWidget {
  const BagView({super.key});
  
  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  String _PPUrl =
      'https://i.imgflip.com/3gzjfj.jpg';
  @override
  Widget build(BuildContext context) {
    return _bagViewStack();
  }

  Stack _bagViewStack() {
    return Stack(children: [
    ListView(
      children: [
        Padding(
          padding: PaddingConstant.instance.left10,
          child: Card(
            elevation: 0,
            child: Text(
              'My Bag',
              style: StyleConstant.instance.ts30bold,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: _products(),
        ),
        SizedBox(
          height: 100,
        )
      ],
    ),
    Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         CustomButton(onPress: (){
          
         }, child: Text("CHECK OUT")),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          color: ColorConstant.instance.background,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Total amount:",style: StyleConstant.instance.ts14,), Text("51\$",style:StyleConstant.instance.ts18White,)],
          ),
        ),
       
       
      ]),
    ),
  ]);
  }

  ListView _products() {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 20,
            ),
        itemCount: 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _productCard();
        });
  }

  Card _productCard() {
    return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: ColorConstant.instance.dark,
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 128,
                    width: 104,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(10)),
                      child: Image(
                        image: NetworkImage(_PPUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      trailing: Icon(
                        Icons.more_vert,
                        color: ColorConstant.instance.gray,
                      ),
                      title: Text(
                        "Pullover",
                        style: StyleConstant.instance.ts16White,
                      ),
                      subtitle: Wrap(
                        spacing: 10,
                        children: [
                          Text(
                            "Color: Black",
                            style: StyleConstant.instance.ts11Gray,
                          ),
                          Text(
                            "Size: L",
                            style: StyleConstant.instance.ts11Gray,
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      trailing: Text(
                        "51\$",
                        style: StyleConstant.instance.ts14White,
                      ),
                      title: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 5,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorConstant.instance.dark),
                                  shape: MaterialStateProperty.all(
                                      CircleBorder())),
                              onPressed: () {},
                              child: Icon(Icons.remove)),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              "1",
                              style: StyleConstant.instance.ts14White,
                            ),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      ColorConstant.instance.dark),
                                  shape: MaterialStateProperty.all(
                                      CircleBorder())),
                              onPressed: () {},
                              child: Icon(Icons.add)),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
  }
}
