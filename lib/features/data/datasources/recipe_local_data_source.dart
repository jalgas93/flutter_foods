import 'dart:convert';

import 'package:flutter_food_repipe/core/errors/exeptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/recipe_model.dart';

abstract class RecipeLocalDataSource {
  Future<List<RecipeModel>> getLastRecipeFromCache();

  Future<void> recipeToCache(List<RecipeModel> recipe);
}

const CACHE_RECIPE_LIST = 'cache_recipe_list';

class RecipeLocalDataSourceImpl implements RecipeLocalDataSource {
  final SharedPreferences sharedPreferences;

  RecipeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<RecipeModel>> getLastRecipeFromCache() {
    final jsonRecipeList = sharedPreferences.getStringList(CACHE_RECIPE_LIST);
    if (jsonRecipeList!.isNotEmpty) {
      print('Get Recipe From Cache: ${jsonRecipeList.length}');
      return Future.value(jsonRecipeList
          .map((e) => RecipeModel.fromJson(json.decode(e)))
          .toList());
    } else {
      throw CacheExeption();
    }
  }

  @override
  Future<void> recipeToCache(List<RecipeModel> recipe) {
    final List<String> jsonRecipeList =
        recipe.map((e) => json.encode(e.toJson())).toList();
    sharedPreferences.setStringList(CACHE_RECIPE_LIST, jsonRecipeList);
    print('Persons to write Cache:${jsonRecipeList.length}');
    return Future.value(jsonRecipeList);
  }
}
