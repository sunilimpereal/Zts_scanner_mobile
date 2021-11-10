// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        required this.userId,
        required this.token,
    });

    int userId;
    String token;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userId: json["user_id"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "token": token,
    };
}
