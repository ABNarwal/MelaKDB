// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.shopcode,
    required this.name,
    required this.rate,
    required this.remarks,
  });

  int shopcode;
  String name;
  int rate;
  String remarks;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        shopcode: json["shopcode"],
        name: json["name"],
        rate: json["rate"],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "shopcode": shopcode,
        "name": name,
        "rate": rate,
        "remarks": remarks,
      };
}
