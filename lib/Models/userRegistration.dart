// To parse this JSON data, do
//
//     final userRegistration = userRegistrationFromJson(jsonString);

import 'dart:convert';

List<UserRegistration> userRegistrationFromJson(String str) =>
    List<UserRegistration>.from(
        json.decode(str).map((x) => UserRegistration.fromJson(x)));

String userRegistrationToJson(List<UserRegistration> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserRegistration {
  UserRegistration({
    required this.srno,
    required this.name,
    required this.fName,
    required this.mobile,
    required this.email,
    required this.state,
    required this.district,
    required this.address,
    required this.gender,
    required this.team,
    required this.category,
    required this.gsTNo,
    required this.gsTCertificate,
    required this.photo,
  });

  int srno;
  String name;
  String fName;
  String mobile;
  String email;
  String state;
  String district;
  String address;
  String gender;
  int team;
  String category;
  String gsTNo;
  dynamic gsTCertificate;
  String photo;

  factory UserRegistration.fromJson(Map<String, dynamic> json) =>
      UserRegistration(
        srno: json["srno"],
        name: json["name"],
        fName: json["fName"],
        mobile: json["mobile"],
        email: json["email"],
        state: json["state"],
        district: json["district"],
        address: json["address"],
        gender: json["gender"],
        team: json["team"],
        category: json["category"],
        gsTNo: json["gsT_No"],
        gsTCertificate: json["gsT_Certificate"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "srno": srno,
        "name": name,
        "fName": fName,
        "mobile": mobile,
        "email": email,
        "state": state,
        "district": district,
        "address": address,
        "gender": gender,
        "team": team,
        "category": category,
        "gsT_No": gsTNo,
        "gsT_Certificate": gsTCertificate,
        "photo": photo,
      };
}
