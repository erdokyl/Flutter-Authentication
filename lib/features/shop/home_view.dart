import 'package:auth_op/constants/color_constants.dart';
import 'package:auth_op/constants/padding_constant.dart';
import 'package:auth_op/features/shop/bag/view/bag_view.dart';
import 'package:auth_op/features/shop/favorites/view/favorites_view.dart';
import 'package:auth_op/features/shop/profile/view/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        backgroundColor: Colors.black,
        tabBar: CupertinoTabBar(
            inactiveColor: ColorConstant.instance.gray,
            activeColor: ColorConstant.instance.primary,
            backgroundColor: ColorConstant.instance.background,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Shop"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: "Bag"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart_fill), label: "Favorites"),
              BottomNavigationBarItem(
                  icon: GestureDetector(
                      onDoubleTap: () {}, child: Icon(Icons.person)),
                  label: "Profile"),
            ]),
        tabBuilder: (context, index) {
          return CupertinoTabView(builder: (context) {
            return Scaffold(
                body: getPage(index),
                appBar: AppBar(
                  actions: [
                    Padding(
                      padding: PaddingConstant.instance.right16,
                      child: Icon(
                        Icons.search,
                        color: ColorConstant.instance.white,
                        size: 32,
                      ),
                    )
                  ],
                ));
            return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  trailing: Icon(
                    Icons.search,
                    color: ColorConstant.instance.white,
                  ),
                  backgroundColor: ColorConstant.instance.background,
                ),
                child: getPage(index));
          });
        });
  }

  Widget getPage(index) {
    switch (index) {
      case 0:
        return Info();
      case 1:
        return SizedBox();
      case 2:
        return BagView();
      case 3:
        return FavoritesView();
      case 4:
        return ProfileView();
      default:
        return SizedBox();
    }
  }

  Widget deneme(context, index) {
    switch (index) {
      case 0:
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: Text(
                  "SA",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              backgroundColor: Colors.grey,
              child: Info());
        });
      case 1:
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(child: SizedBox());
        });
      case 2:
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                trailing: Icon(
                  Icons.search,
                  color: ColorConstant.instance.white,
                ),
                backgroundColor: ColorConstant.instance.background,
              ),
              child: BagView());
        });
      case 3:
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(child: SizedBox());
        });
      case 4:
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                trailing: Icon(
                  Icons.search,
                  color: ColorConstant.instance.white,
                ),
                backgroundColor: ColorConstant.instance.background,
              ),
              child: ProfileView());
        });
      default:
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(child: SizedBox());
        });
    }
  }
}

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("DENEME"),
      ),
      body: Center(
        child: Text("Detail"),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Detail()));
            },
            child: Text("A")),
      ),
    );
  }
}
