import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zts_scanner_mobile/authentication/login/bloc/login_stream.dart';
import 'package:zts_scanner_mobile/authentication/login/data/models/login_request_model.dart';
import 'package:zts_scanner_mobile/authentication/login/data/models/login_respose_model.dart';
import 'package:zts_scanner_mobile/repository/repositry.dart';
import 'package:zts_scanner_mobile/utils/shared_pref.dart';

import '../../../../main.dart';


class LoginRepository {
  Future<bool> login(
      {required BuildContext context, required String mobile, required String password}) async {
    try {
          Map<String, String>? postheaders = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${sharedPref.token}',
  };
      LoginRequest loginRequest = LoginRequest(mobile: mobile, password: password);
      final response = await API.post(url: 'login/', body: loginRequest.toJson(), context: context,headers: postheaders);
      if (response.statusCode == 200) {
        LoginResponse loginResponse = loginResponseFromJson(response.body);
        sharedPrefs.setUserDetails(
          userId: loginResponse.userId.toString(),
          userMobile: mobile,
        );
        sharedPrefs.ticektCount(0);
        sharedPref.setLoggedIn();
        sharedPref.setAuthToken(token: loginResponse.token);
        CheckLoginProvider.of(context)?.login();

        return true;
      } else {
        log('filaed 2');
        return false;
      }
    } catch (e) {
      log('filaed 3 $e');
      return false;
    }
  }
}
