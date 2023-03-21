import 'package:flutter/material.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/style_constants.dart';
import '../../../constants/text_constants.dart';
import '../service/auth_service.dart';
import '../viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});
  static const String routeName = "/auth-view";
  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  late final AuthViewModel _authViewModel;
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _emailController;
  late final TextEditingController _pwdController;
  late final TextEditingController _rePwdController;

  void loginUser(BuildContext context) {
    AuthService().login(
        context: context,
        pwd: _pwdController.text,
        email: _emailController.text);
  }

  void registerUser(BuildContext context) {
    AuthService().register(
        context: context,
        pwd: _pwdController.text,
        re_pwd: _rePwdController.text,
        email: _emailController.text,
        name: _nameController.text,
        surname: _surnameController.text);
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _emailController = TextEditingController();
    _pwdController = TextEditingController();
    _rePwdController = TextEditingController();

    _authViewModel = AuthViewModel();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _pwdController.dispose();
    _rePwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _authViewModel,
      builder: (context, child) {
        return context.watch<AuthViewModel>().isLoginPage
            ? _loginView(context)
            : _registerView(context);
      },
    );
  }

  Scaffold _loginView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextConstant.instance.login2,
              style: StyleConstant.instance.ts36bold,
            ),
            SizedBox(height: 30),
            CustomTextFormField(
                  controller: _emailController, hintText: "Email"),
            SizedBox(height: 10),
            TextFormField(
                style: StyleConstant.instance.ts14White,
                cursorColor: ColorConstant.instance.gray,
                decoration: InputDecoration(
                  suffix: InkWell(
                    splashColor: Colors.transparent,
                    child: context.watch<AuthViewModel>().isPwdEnable
                        ? Text('Show',style: StyleConstant.instance.ts14,)
                        : Text('Hide',style: StyleConstant.instance.ts14),
                    onTap: () {
                      context.read<AuthViewModel>().changePwdEnable();
                    },
                  ),
                    labelText: "Password",
                    labelStyle: StyleConstant.instance.ts14,
                    fillColor: ColorConstant.instance.dark,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.instance.gray),
                        borderRadius: BorderRadius.circular(6)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.instance.dark),
                        borderRadius: BorderRadius.circular(6))),
                obscureText: context.watch<AuthViewModel>().isPwdEnable,
                controller: _pwdController,
              ),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: StyleConstant.instance.ts14White,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.arrow_right_alt,
                      color: ColorConstant.instance.primary,
                    ),
                    onTap: () {
                      context.read<AuthViewModel>().changePage();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomButton(
                onPress: () {
                  loginUser(context);
                },
                child: Text(TextConstant.instance.login,style: StyleConstant.instance.ts14White),
              ),
          ],
        ),
      ),
    );
  }

  Scaffold _registerView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextConstant.instance.signUp2,
                style: StyleConstant.instance.ts36bold,
              ),
              SizedBox(height: 30),
              CustomTextFormField(
                  controller: _nameController, hintText: "Name"),
              SizedBox(height: 10,),
              CustomTextFormField(
                  controller: _surnameController, hintText: "Surname"),
              
              SizedBox(height: 10),
              CustomTextFormField(
                  controller: _emailController, hintText: "Email"),
              
              SizedBox(height: 10),
              TextFormField(
                style: StyleConstant.instance.ts14White,
                cursorColor: ColorConstant.instance.gray,
                decoration: InputDecoration(
                  suffix: InkWell(
                    splashColor: Colors.transparent,
                    child: context.watch<AuthViewModel>().isPwdEnable
                        ? Text('Show',style: StyleConstant.instance.ts14,)
                        : Text('Hide',style: StyleConstant.instance.ts14),
                    onTap: () {
                      context.read<AuthViewModel>().changePwdEnable();
                    },
                  ),
                    labelText: "Password",
                    labelStyle: StyleConstant.instance.ts14,
                    fillColor: ColorConstant.instance.dark,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.instance.gray),
                        borderRadius: BorderRadius.circular(6)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.instance.dark),
                        borderRadius: BorderRadius.circular(6))),
                obscureText: context.watch<AuthViewModel>().isPwdEnable,
                controller: _pwdController,
              ),
              SizedBox(height: 10),
              TextFormField(
                style: StyleConstant.instance.ts14White,
                cursorColor: ColorConstant.instance.gray,
                decoration: InputDecoration(
                  suffix: InkWell(
                    splashColor: Colors.transparent,
                    child: context.watch<AuthViewModel>().isPwdEnable
                        ? Text('Show',style: StyleConstant.instance.ts14,)
                        : Text('Hide',style: StyleConstant.instance.ts14),
                    onTap: () {
                      context.read<AuthViewModel>().changePwdEnable();
                    },
                  ),
                    labelText: "Re Password",
                    labelStyle: StyleConstant.instance.ts14,
                    fillColor: ColorConstant.instance.dark,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.instance.gray),
                        borderRadius: BorderRadius.circular(6)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.instance.dark),
                        borderRadius: BorderRadius.circular(6))),
                obscureText: context.watch<AuthViewModel>().isPwdEnable,
                controller: _rePwdController,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Do you have an account?",
                    style: StyleConstant.instance.ts14White,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.arrow_right_alt,
                      color: ColorConstant.instance.primary,
                    ),
                    onTap: () {
                      context.read<AuthViewModel>().changePage();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomButton(
                onPress: () {
                  registerUser(context);
                },
                child: Text(TextConstant.instance.signUp,style: StyleConstant.instance.ts14White),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
