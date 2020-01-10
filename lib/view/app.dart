import 'package:flutter/material.dart';

class TentangApp extends StatelessWidget {

  final String judul = "Tugas Akhir - OSG8 Group 9";
  final String deskripsi = "Aplikasi Flutter menampilkan daftar Makanan berdasarkan kategori dan resep. Menggunakan API https://themealdb.com/ sebagai data.";
  final Image gambar = Image.asset("images/meal-icon.png");


  @override
  Widget build(BuildContext context) {
    return getContent();
  }

  getContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/meal-icon.png"),
          Text(judul, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),),
          SizedBox(height: 10.0,),
          Text(deskripsi, style: TextStyle(fontSize: 20.0),),
        ],
      ),
    );
  }


}
