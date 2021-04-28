// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.responce,
    this.data,
    this.message
  });

  bool responce;
  RegisterData data;
  String message;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    responce: json["responce"] == null ? null : json["responce"],
    data: json["data"] == null ? null : RegisterData.fromJson(json["data"]),
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "responce": responce == null ? null : responce,
    "data": data == null ? null : data.toJson(),
  };
}

class RegisterData {
  RegisterData({
    this.userId,
    this.userPhone,
    this.userFullname,
    this.userEmail,
    this.userBdate,
    this.userImage,
  });

  int userId;
  String userPhone;
  String userFullname;
  String userEmail;
  String userBdate;
  String userImage;

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
    userId: json["user_id"] == null ? null : json["user_id"],
    userPhone: json["user_phone"] == null ? null : json["user_phone"],
    userFullname: json["user_fullname"] == null ? null : json["user_fullname"],
    userEmail: json["user_email"] == null ? null : json["user_email"],
    userBdate: json["user_bdate"] == null ? null : json["user_bdate"],
    userImage: json["user_image"] == null ? null : json["user_image"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId == null ? null : userId,
    "user_phone": userPhone == null ? null : userPhone,
    "user_fullname": userFullname == null ? null : userFullname,
    "user_email": userEmail == null ? null : userEmail,
    "user_bdate": userBdate == null ? null : userBdate,
    "user_image": userImage == null ? null : userImage,
  };
}
