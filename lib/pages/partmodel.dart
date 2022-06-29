import 'dart:convert';

List<PartData> partDataFromJson(String str) =>
    List<PartData>.from(json.decode(str).map((x) => PartData.fromJson(x)));

String partDataToJson(List<PartData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PartData {
  PartData({
    required this.partName,
    required this.partCode,
  });

  String partName;
  String partCode;

  factory PartData.fromJson(Map<String, dynamic> json) => PartData(
        partName: json["partName"],
        partCode: json["partCode"],
      );

  Map<String, dynamic> toJson() => {
        "partName": partName,
        "partCode": partCode,
      };
}
