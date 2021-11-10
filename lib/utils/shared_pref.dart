import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _sharedPref;
  init() async {
    if (_sharedPref == null) {
      _sharedPref = await SharedPreferences.getInstance();
    }
  }

  //gettter
  bool get loggedIn => _sharedPref!.getBool('loggedIn') ?? false;
  String get loginId => _sharedPref!.getString('userId') ?? "";
  String get userEmail => _sharedPref!.getString('userEmail') ?? "";
  String get organizationName => _sharedPref!.getString('organizationName') ?? "";
  String get organizationLogo => _sharedPref!.getString('organizationLogo') ?? "";
  String get ticketCount => _sharedPref!.getString('ticketCount') ?? "0";

  String? get token => _sharedPref!.getString('authToken');
  ticektCount(int ticketCount) {
    _sharedPref!.setString('ticketCount', ticketCount.toString());
  }

  ///Set as logged in
  setLoggedIn() {
    _sharedPref!.setBool('loggedIn', true);
  }

  /// Set as logged out
  setLoggedOut() {
    _sharedPref!.setBool('loggedIn', false);
    // _sharedPref!.remove('authToken');
  }

  /// Set uuid for the user
  setUserDetails({
    required String userId,
    required String userMobile,
  }) {
    _sharedPref!.setString('userId', loginId);
    _sharedPref!.setString('userMobile', userMobile);
  }

  ///set Auth token for the app
  setAuthToken({required String token}) {
    log("see tocken $token");
    _sharedPref!.setString('authToken', token);
  }
}

final sharedPrefs = SharedPref();
