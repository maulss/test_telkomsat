// To parse this JSON data, do
//
//     final responseLoginModel = responseLoginModelFromJson(jsonString);

import 'dart:convert';

ResponseLoginModel responseLoginModelFromJson(String str) =>
    ResponseLoginModel.fromJson(json.decode(str));

String responseLoginModelToJson(ResponseLoginModel data) =>
    json.encode(data.toJson());

class ResponseLoginModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;
  String? refreshToken;

  ResponseLoginModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
    this.refreshToken,
  });

  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) =>
      ResponseLoginModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
        token: json["token"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
        "refreshToken": refreshToken,
      };
}
