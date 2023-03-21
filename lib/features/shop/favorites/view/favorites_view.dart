import 'package:auth_op/components/custom_container.dart';
import 'package:flutter/material.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/star_display.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/padding_constant.dart';
import '../../../../constants/style_constants.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  String _PPUrl = 'https://i.imgflip.com/3gzjfj.jpg';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: PaddingConstant.instance.left10,
          child: Card(
            elevation: 0,
            child: Text(
              'Favorites',
              style: StyleConstant.instance.ts30bold,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: PaddingConstant.instance.hori12,
          child: SizedBox(
            height: 30,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return CustomContainer(
                      child: Center(
                    child: Text(
                      "T-shirts",
                      style: StyleConstant.instance.ts14Dark,
                    ),
                  ));
                }),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      width: 15,
                    ),
                itemCount: 6),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: PaddingConstant.instance.hori12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 5,
                children: [
                  Icon(
                    Icons.apps,
                    color: ColorConstant.instance.white,
                  ),
                  Padding(
                    padding: PaddingConstant.instance.top6,
                    child: Text(
                      "Filters",
                      style: StyleConstant.instance.ts11White,
                    ),
                  )
                ],
              ),
              Wrap(
                spacing: 5,
                children: [
                  Icon(Icons.arrow_downward,
                      color: ColorConstant.instance.white),
                  Padding(
                    padding: PaddingConstant.instance.top6,
                    child: Text(
                      "Price: lowest to high",
                      style: StyleConstant.instance.ts11White,
                    ),
                  )
                ],
              ),
              Icon(Icons.category, color: ColorConstant.instance.white)
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: _products(),
        ),
      ],
    );
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
          return _favCard();
        });
  }

  Card _favCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: PaddingConstant.instance.tlr10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "LIME",
                        style: StyleConstant.instance.ts11Gray,
                      ),
                      Icon(Icons.close, color: ColorConstant.instance.gray)
                    ],
                  ),
                ),
                Padding(
                  padding: PaddingConstant.instance.left10,
                  child: Wrap(
                    spacing: 5,
                    direction: Axis.vertical,
                    children: [
                      Text(
                        "Shirt",
                        style: StyleConstant.instance.ts16White,
                      ),
                      Wrap(
                        spacing: 25,
                        children: [
                          Wrap(
                            children: [
                              Text(
                                "Color:",
                                style: StyleConstant.instance.ts11Gray,
                              ),
                              Text(
                                "Blue",
                                style: StyleConstant.instance.ts11White,
                              )
                            ],
                          ),
                          Wrap(
                            children: [
                              Text(
                                "Size:",
                                style: StyleConstant.instance.ts11Gray,
                              ),
                              Text(
                                "L",
                                style: StyleConstant.instance.ts11White,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: PaddingConstant.instance.left10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "32\$",
                        style: StyleConstant.instance.ts14White,
                      ),
                      Wrap(
                        spacing: 5,
                        children: [
                         IconTheme(
                        data: IconThemeData(
                          color: Colors.amber,
                          size: 16,
                        ),
                        child: StarDisplay(value: 3),
                      ),
                      Padding(
                        padding: PaddingConstant.instance.top2,
                        child: Text("(10)",style: StyleConstant.instance.ts11Gray,),
                      )
                      ],),
                      FloatingActionButton.small(
                          elevation: 0,
                          child: Icon(Icons.shopping_bag,size: 18,),
                          backgroundColor: ColorConstant.instance.primary,
                          onPressed: () {})
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
