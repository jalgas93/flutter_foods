import 'dart:convert';
import 'package:flutter_food_repipe/core/errors/exeptions.dart';
import 'package:flutter_food_repipe/features/data/models/recipe_model.dart';
import 'package:http/http.dart' as http;

abstract class RecipeRemoteDataSource {
//https://food2fork.ca/api/recipe/get/?id=9
  Future<List<RecipeModel>> findByRecipeId(int page);

//https://food2fork.ca/api/recipe/search/?page=2&query=beef carrot potato onion
  Future<List<RecipeModel>> searchForRecipes(String query);
}

const String token = 'Token 9c8b06d329136da358c2d00e76946b0111ce2c48';
class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final http.Client client;

  RecipeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RecipeModel>> findByRecipeId(int page) =>
      _getRecipeFormUrl('https://food2fork.ca/api/recipe/get/?id=$page');

  @override
  Future<List<RecipeModel>> searchForRecipes(String query) => _getRecipeFormUrl(
      'https://food2fork.ca/api/recipe/search/?page=2&query=$query');

  Future<List<RecipeModel>> _getRecipeFormUrl(String url) async {
    print(url);
    final responce = await client
        .get(Uri.parse(url), headers: {'ContentType': 'application/json', 'Authorization': '$token'});
    if (responce.statusCode == 200) {
      final recipe = json.decode(responce.body);
      return (recipe['results'] as List)
          .map((e) => RecipeModel.fromJson(e))
          .toList();
    } else {
      throw ServerExeption();
    }
  }
}
