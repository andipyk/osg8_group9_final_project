import 'package:flutter/material.dart';
import 'package:group09/model/model_ingredien.dart';
import 'dart:convert';
import 'package:group09/view/filter.dart';

class Ingredien extends StatefulWidget {
  @override
  _IngredienState createState() => _IngredienState();
}

class _IngredienState extends State<Ingredien> {
  @override
  Widget build(BuildContext context) {
    return getListIngredient();
  }

  getListIngredient() {
    return Center(
      child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('data/data_ingredien.json'),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                List<IngredienList> ingredien = parseJson(snapshot.data);
                return ingredien.isNotEmpty
                    ? _showIngredienList(context, ingredien)
                    : Center(child: Text("Tidak ada List Ingredien.."));
              } else {
                return Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white)));
              }
            } else {
              return Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white)));
            }
          }),
    );
  }

  Widget _showIngredienList(BuildContext context, List<IngredienList> data) =>
      ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  filterIngredien(data[index].strIngredient);
                },
                title: Text(
                  data[index].strIngredient,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            );
          });

  List<IngredienList> parseJson(String response) {
    if (response == null) {
      return [];
    } else {
      final parsed =
          json.decode(response.toString()).cast<Map<String, dynamic>>();
      return parsed
          .map<IngredienList>((json) => new IngredienList.fromJson(json))
          .toList();
    }
  }

  filterIngredien(String strIngredient) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FilterIngredien(strIngredient)));
  }
}
