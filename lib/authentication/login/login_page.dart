import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zts_scanner_mobile/authentication/login/bloc/login_bloc.dart';
import 'package:zts_scanner_mobile/authentication/login/data/repository/login_repository.dart';
import 'package:zts_scanner_mobile/authentication/login/widgets/button.dart';
import 'package:zts_scanner_mobile/authentication/login/widgets/text_field.dart';
import 'package:zts_scanner_mobile/dashboard/screen/dashboard_home.dart';
import 'package:zts_scanner_mobile/settings/screen/settings_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode mobileFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool loginFailFlag = false;
  bool _keyboardVisible = false;
  ontap() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    LoginBloc? loginBloc = LoginProvider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background-login.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: logincard(loginBloc),
            ),
          ),
          !_keyboardVisible
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Material(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => SettingsScreen()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.settings,
                                        size: 24,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Settings',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget logincard(LoginBloc? loginBloc) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            16,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 100,
            width: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              ZTSTextField(
                width: MediaQuery.of(context).size.width * 0.75,
                controller: mobileController,
                focusNode: mobileFocus,
                icon: Icons.email,
                labelText: 'Mobile',
                onChanged: loginBloc!.changeMobile,
                onfocus: mobileFocus.hasFocus,
                onTap: ontap,
                stream: loginBloc.mobile,
                heading: 'Mobile',
                keyboardType: TextInputType.number,
              ),
              ZTSTextField(
                width: MediaQuery.of(context).size.width * 0.75,
                controller: passwordController,
                focusNode: passwordFocus,
                icon: Icons.email,
                labelText: 'Password',
                onChanged: loginBloc.changePassword,
                onfocus: passwordFocus.hasFocus,
                onTap: ontap,
                stream: loginBloc.password,
                obscureText: true,
                heading: 'Password',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZTSStreamButton(
                width: 230,
                formValidationStream: loginBloc.validateFormStream,
                submit: () async {
                  LoginRepository loginRepository = LoginRepository();
                  loginRepository
                      .login(
                    mobile: mobileController.text,
                    password: passwordController.text,
                    context: context,
                  )
                      .then((value) {
                    Future.delayed(const Duration(milliseconds: 100)).then((value1) {
                      if (value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardScanScreen(),
                          ),
                        );
                      }
                      setState(() {
                        loginFailFlag = !value;
                      });
                    });
                  });
                },
                text: 'Login',
                errrorText: 'Login Failed',
                errorFlag: loginFailFlag,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
