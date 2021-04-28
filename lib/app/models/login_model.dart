// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.responce,
    this.data,
    this.message
  });

  bool responce;
  LoginData data;
  String message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    responce: json["responce"] == null ? null : json["responce"],
    data: json["data"] == null ? null : LoginData.fromJson(json["data"]),
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "responce": responce == null ? null : responce,
    "data": data == null ? null : data.toJson(),
  };
}

class LoginData {
  LoginData({
    this.userId,
    this.userTypeId,
    this.userFullname,
    this.userEmail,
    this.userPhone,
    this.userBdate,
    this.userImage,
  });

  String userId;
  String userTypeId;
  String userFullname;
  String userEmail;
  String userPhone;
  String userBdate;
  String userImage;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    userId: json["user_id"] == null ? null : json["user_id"],
    userTypeId: json["user_type_id"] == null ? null : json["user_type_id"],
    userFullname: json["user_fullname"] == null ? null : json["user_fullname"],
    userEmail: json["user_email"] == null ? null : json["user_email"],
    userPhone: json["user_phone"] == null ? null : json["user_phone"],
    userBdate: json["user_bdate"] == null ? null : json["user_bdate"],
    userImage: json["user_image"] == null ? null : json["user_image"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId == null ? null : userId,
    "user_type_id": userTypeId == null ? null : userTypeId,
    "user_fullname": userFullname == null ? null : userFullname,
    "user_email": userEmail == null ? null : userEmail,
    "user_phone": userPhone == null ? null : userPhone,
    "user_bdate": userBdate == null ? null : userBdate,
    "user_image": userImage == null ? null : userImage,
  };
}
