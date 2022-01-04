import 'package:flutter/cupertino.dart';
import 'package:flutter_food_repipe/features/domain/entities/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  int pk;
  String title;
  String publisher;
  String featuredImage;
  int rating;
  String sourceUrl;
  String description;
  Null cookingInstructions;
  List<String> ingredients;
  String dateAdded;
  String dateUpdated;
  int longDateAdded;
  int longDateUpdated;

  RecipeModel(
      {required this.pk,
      required this.title,
      required this.publisher,
      required this.featuredImage,
      required this.rating,
      required this.sourceUrl,
      required this.description,
      required this.cookingInstructions,
      required this.ingredients,
      required this.dateAdded,
      required this.dateUpdated,
      required this.longDateAdded,
      required this.longDateUpdated})
      : super(
            pk: pk,
            title: title,
            publisher: publisher,
            featured_image: featuredImage,
            rating: rating,
            source_url: sourceUrl,
            description: description,
            cooking_instructions: cookingInstructions,
            ingredients: ingredients,
            date_added: dateAdded,
            date_updated: dateUpdated,
            long_date_added: longDateAdded,
            long_date_updated: longDateUpdated);

  RecipeModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    title = json['title'];
    publisher = json['publisher'];
    featuredImage = json['featured_image'];
    rating = json['rating'];
    sourceUrl = json['source_url'];
    description = json['description'];
    cookingInstructions = json['cooking_instructions'];
    ingredients = json['ingredients'].cast<String>();
    dateAdded = json['date_added'];
    dateUpdated = json['date_updated'];
    longDateAdded = json['long_date_added'];
    longDateUpdated = json['long_date_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['title'] = this.title;
    data['publisher'] = this.publisher;
    data['featured_image'] = this.featuredImage;
    data['rating'] = this.rating;
    data['source_url'] = this.sourceUrl;
    data['description'] = this.description;
    data['cooking_instructions'] = this.cookingInstructions;
    data['ingredients'] = this.ingredients;
    data['date_added'] = this.dateAdded;
    data['date_updated'] = this.dateUpdated;
    data['long_date_added'] = this.longDateAdded;
    data['long_date_updated'] = this.longDateUpdated;
    return data;
  }
}
