// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  String name;
  String email;
  String password;
  String passwordConfirmation;
  DateTime dob;
  String phone;
  String role;
  String profilePhotoPath;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.dob,
    required this.phone,
    required this.role,
    required this.profilePhotoPath,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    passwordConfirmation: json["password_confirmation"],
    dob: DateTime.parse(json["dob"]),
    phone: json["phone"],
    role: json["role"],
    profilePhotoPath: json["profile_photo_path"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "phone": phone,
    "role": role,
    "profile_photo_path": profilePhotoPath,
  };
}
