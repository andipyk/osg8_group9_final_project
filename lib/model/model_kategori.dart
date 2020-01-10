// To parse this JSON data, do
//
//     final kategoriList = kategoriListFromJson(jsonString);

import 'dart:convert';

List<KategoriList> kategoriListFromJson(String str) => List<KategoriList>.from(json.decode(str).map((x) => KategoriList.fromJson(x)));

String kategoriListToJson(List<KategoriList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KategoriList {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  KategoriList({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory KategoriList.fromJson(Map<String, dynamic> json) => KategoriList(
    idCategory: json["idCategory"],
    strCategory: json["strCategory"],
    strCategoryThumb: json["strCategoryThumb"],
    strCategoryDescription: json["strCategoryDescription"],
  );

  Map<String, dynamic> toJson() => {
    "idCategory": idCategory,
    "strCategory": strCategory,
    "strCategoryThumb": strCategoryThumb,
    "strCategoryDescription": strCategoryDescription,
  };
}
