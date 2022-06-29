// To parse this JSON data, do
//
//     final chapterData = chapterDataFromJson(jsonString);

import 'dart:convert';

List<ChapterData> chapterDataFromJson(String str) => List<ChapterData>.from(
    json.decode(str).map((x) => ChapterData.fromJson(x)));

String chapterDataToJson(List<ChapterData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChapterData {
  ChapterData({
    required this.chapterName,
    required this.chapterCode,
    required this.sectionCode,
    required this.partCode,
  });

  String chapterName;
  String chapterCode;
  String sectionCode;
  String partCode;

  factory ChapterData.fromJson(Map<String, dynamic> json) => ChapterData(
        chapterName: json["chapterName"],
        chapterCode: json["chapterCode"],
        sectionCode: json["sectionCode"],
        partCode: json["partCode"],
      );

  Map<String, dynamic> toJson() => {
        "chapterName": chapterName,
        "chapterCode": chapterCode,
        "sectionCode": sectionCode,
        "partCode": partCode,
      };
}
