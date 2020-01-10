// To parse this JSON data, do
//
//     final tim = timFromJson(jsonString);

import 'dart:convert';

List<Tim> timFromJson(String str) => List<Tim>.from(json.decode(str).map((x) => Tim.fromJson(x)));

String timToJson(List<Tim> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tim {
  String no;
  String nama;
  String email;
  String foto;
  String job;

  Tim({
    this.no,
    this.nama,
    this.email,
    this.foto,
    this.job,
  });

  factory Tim.fromJson(Map<String, dynamic> json) => Tim(
    no: json["no"],
    nama: json["nama"],
    email: json["email"],
    foto: json["foto"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "no": no,
    "nama": nama,
    "email": email,
    "foto": foto,
    "job": job,
  };
}
