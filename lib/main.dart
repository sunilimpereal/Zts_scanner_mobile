import 'package:flutter/material.dart';
import 'package:zts_scanner_mobile/authentication/login/login_page.dart';
import 'package:zts_scanner_mobile/constants/app_fonts.dart';
import 'package:zts_scanner_mobile/constants/appstyles.dart';
import 'package:zts_scanner_mobile/constants/config_.dart';
import 'package:zts_scanner_mobile/constants/themes/theme.dart';
import 'package:zts_scanner_mobile/dashboard/screen/dashboard_home.dart';
import 'package:zts_scanner_mobile/utils/shared_pref.dart';

import 'authentication/login/bloc/login_bloc.dart';
import 'authentication/login/bloc/login_stream.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPref.init();
  runApp(const AppWrapperProvider());
}

AppStyles appStyles = AppStyles();
AppFonts appFonts = AppFonts();
Config config = Config();
SharedPref sharedPref = SharedPref();

class AppWrapperProvider extends StatelessWidget {
  const AppWrapperProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckLoginProvider(
      child: LoginProvider(
        child: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'ZTS Scanner',
      initialRoute: !sharedPref.loggedIn ? '/login' : '/dashboard',
      onGenerateRoute: onGeneratedRoute,
    );
  }

  Route onGeneratedRoute(RouteSettings routeSettings) {
    if (routeSettings.name == '/login') {
      return MaterialPageRoute(builder: (_) => const LoginPage());
    }
    if (routeSettings.name == '/dashboard') {
      return MaterialPageRoute(builder: (_) => const DashboardScanScreen());
    }
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }
}
