import 'package:flutter/material.dart';

// class Filter extends StatelessWidget {
//   final String filterNama;

//   Filter(this.filterNama);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Container(
//           child: Text("${this.filterNama}"),
//         ));
//   }
// }

class FilterIngredien extends StatefulWidget {
  final String strIngredient;

  FilterIngredien(this.strIngredient);

  @override
  _FilterIngredienState createState() => _FilterIngredienState();
}

class _FilterIngredienState extends State<FilterIngredien> {
  @override
  Widget build(BuildContext context) {
    String kataKunci = widget.strIngredient.replaceAll(RegExp(' +'), '_');

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Text("$kataKunci"),
        ));
  }
}
