class FilterIngredienList {
  String strMeal;
  String strMealThumb;
  String idMeal;

  FilterIngredienList({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory FilterIngredienList.fromJson(Map<String, dynamic> parsedJson) {
    return FilterIngredienList(
      strMeal: parsedJson['strMeal'],
      strMealThumb: parsedJson['strMealThumb'],
      idMeal: parsedJson['idMeal'],
    );
  }
}
