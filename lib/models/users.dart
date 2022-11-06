// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    @required this.username,
    this.password,
    this.repPassword,
    this.nickName,
    this.mobile,
    @required this.email,
  });

  String username;
  String password;
  String repPassword;
  String nickName;
  String mobile;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        password: json["password"],
        repPassword: json["repPassword"],
        nickName: json["nickName"],
        mobile: json["mobile"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "repPassword": repPassword,
        "nickName": nickName,
        "mobile": mobile,
        "email": email,
      };
}
