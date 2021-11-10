// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
    LoginRequest({
        required this.mobile,
        required this.password,
    });

    String mobile;
    String password;

    factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        mobile: json['mobile'],
        password: json['password'],
    );

    Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'password': password,
    };
}
