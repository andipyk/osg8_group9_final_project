import 'package:flutter/material.dart';
import 'package:group09/model/model_kategori.dart';

class KategoriDetail extends StatelessWidget {

  final KategoriList kategoriList;
  KategoriDetail(this.kategoriList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            kategoriList.strCategory,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: getDetail());
  }


  getDetail() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(kategoriList.strCategoryThumb),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(3.0),
              child: Text(
                kategoriList.strCategory,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Descriptions :",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      kategoriList.strCategoryDescription,
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
