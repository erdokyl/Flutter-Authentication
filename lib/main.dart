import 'package:auth_op/features/auth/view/auth_view.dart';
import 'package:auth_op/features/shop/home_view.dart';
import 'package:auth_op/features/shop/profile/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/color_constants.dart';
import 'features/auth/viewmodel/user_view_model.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel())
      ], child: const MyApp()),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: AuthView(),
      theme: ThemeData(
            cardTheme: CardTheme(color: ColorConstant.instance.background),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              
              unselectedItemColor: ColorConstant.instance.gray,
              selectedItemColor: ColorConstant.instance.primary,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: TextStyle(color: ColorConstant.instance.gray),
                unselectedIconTheme:
                    IconThemeData(color: ColorConstant.instance.gray),
                selectedLabelStyle: TextStyle(color: ColorConstant.instance.primary),
                selectedIconTheme:
                    IconThemeData(color: ColorConstant.instance.primary),
                backgroundColor: ColorConstant.instance.background
                ),
            
            
            scaffoldBackgroundColor: ColorConstant.instance.background,
            tabBarTheme: TabBarTheme(
                unselectedLabelColor: ColorConstant.instance.gray,
                labelColor: ColorConstant.instance.primary),
            appBarTheme: AppBarTheme(elevation: 0, color: Colors.transparent)),
    );
  }
}