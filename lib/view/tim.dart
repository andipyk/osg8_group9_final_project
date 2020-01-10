import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:group09/model/model_tim.dart';

class TentangTim extends StatefulWidget {
  @override
  _TentangTimState createState() => _TentangTimState();
}

class _TentangTimState extends State<TentangTim> {
  @override
  Widget build(BuildContext context) {
    return getTim();
  }


  getTim() {
    return Container(
      child: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('data/data_tim.json'),
            builder: (ctx, snapshot) {

              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  List<Tim> tim = parseJson(snapshot.data);
                  return tim.isNotEmpty
                      ? _showList(context, tim)
                      : Center(child: Text("No Tim List Found.."));
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

  Widget _showList(BuildContext context, List<Tim> data) => GridView.builder(
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
                onPressed: () {},
                child: Image.asset('images/${data[index].foto}'),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.all(0)),
            footer: Container(
              color: Colors.white70,
              padding: EdgeInsets.all(3.0),
              child: Text(
                data[index].nama,
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

  List<Tim> parseJson(String response) {
    if (response == null) {
      return [];
    } else {
      final parsed =
      json.decode(response.toString()).cast<Map<String, dynamic>>();
      return parsed.map<Tim>((json) => Tim.fromJson(json)).toList();
    }
  }

}
