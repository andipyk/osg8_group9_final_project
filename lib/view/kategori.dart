import 'package:flutter/material.dart';
import 'package:group09/model/model_kategori.dart';
import 'dart:convert';
import 'package:group09/view/detail.dart';


class Kategori extends StatefulWidget {
  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  @override
  Widget build(BuildContext context) {
    return getList();
  }


  getList() {
    return Container(
      child: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('data/data_categories.json'),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  List<KategoriList> meals = parseJson(snapshot.data);
                  return meals.isNotEmpty
                      ? _showList(context, meals)
                      : Center(child: Text("No Category List Found.."));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }


  Widget _showList(BuildContext context, List<KategoriList> data) => GridView.builder(
    itemCount: data == null ? 0 : data.length,
    gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          margin: EdgeInsets.all(10),
          child: GridTile(
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KategoriDetail(data[index])),
                  );

                },
                child: Image.network(data[index].strCategoryThumb),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.all(0)),
            footer: Container(
              color: Colors.white70,
              padding: EdgeInsets.all(3.0),
              child: Text(
                data[index].strCategory,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent),
              ),
            ),
          ),
        ),
      );
    },
  );

  List<KategoriList> parseJson(String response) {
    if (response == null) {
      return [];
    } else {
      final parsed =
      json.decode(response.toString()).cast<Map<String, dynamic>>();
      return parsed.map<KategoriList>((json) => KategoriList.fromJson(json)).toList();
    }
  }
}
