import 'dart:convert';

List<SectionData> sectionDataFromJson(String str) => List<SectionData>.from(
    json.decode(str).map((x) => SectionData.fromJson(x)));

String sectionDataToJson(List<SectionData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SectionData {
  SectionData({
    required this.sectionName,
    required this.sectionCode,
    this.partcode,
  });

  String sectionName;
  String sectionCode;
  dynamic partcode;

  factory SectionData.fromJson(Map<String, dynamic> json) => SectionData(
        sectionName: json["sectionName"] == null ? null : json["sectionName"],
        sectionCode: json["sectionCode"] == null ? null : json["sectionCode"],
        partcode: json["partcode"],
      );

  Map<String, dynamic> toJson() => {
        "sectionName": sectionName == null ? null : sectionName,
        "sectionCode": sectionCode == null ? null : sectionCode,
        "partcode": partcode,
      };
}
