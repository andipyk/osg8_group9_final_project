import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Category {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  Category(
    {this.idCategory,
    this.strCategory,
    this.strCategoryThumb
  });

  factory Category.fromJson(Map<string, dynamic> parsedJson) {
    
  }

}


class Meal {
  String idMeal;
  String strMeal;
  String strInstructions;
  String strMealThumb;
  String strIngredient;

  Meal(
      {this.idMeal,
      this.strMeal,
      this.strInstructions,
      this.strMealThumb,
      this.strIngredient});

  factory Meal.fromJson(Map<String, dynamic> parsedJson) {
    String _strIngredient = parsedJson['strIngredient1'] +
        ", " +
        parsedJson['strIngredient2'] +
        ", " +
        parsedJson['strIngredient3'] +
        ", " +
        parsedJson['strIngredient4'] +
        ", " +
        parsedJson['strIngredient5'];
    return Meal(
        idMeal: parsedJson['idMeal'],
        strMeal: parsedJson['strMeal'],
        strInstructions: parsedJson['strInstructions'],
        strMealThumb: parsedJson['strMealThumb'],
        strIngredient: _strIngredient);
  }
}
