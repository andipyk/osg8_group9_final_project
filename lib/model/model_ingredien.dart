class IngredienList {
  String idIngredient;
  String strIngredient;
  String strDescription;

  IngredienList({
    this.idIngredient,
    this.strIngredient,
    this.strDescription,
  });

  factory IngredienList.fromJson(Map<String, dynamic> parsedJson) {
    return IngredienList(
      idIngredient: parsedJson['idIngredient'],
      strIngredient: parsedJson['strIngredient'],
      strDescription: parsedJson['strDescription'],
    );
  }
}
