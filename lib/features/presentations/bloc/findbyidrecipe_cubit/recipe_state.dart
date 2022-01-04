import 'package:equatable/equatable.dart';
import 'package:flutter_food_repipe/features/data/models/recipe_model.dart';
import 'package:flutter_food_repipe/features/domain/entities/recipe_entity.dart';

abstract class RecipeState extends Equatable {
  RecipeState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RecipeEmpty extends RecipeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RecipeLoading extends RecipeState {
  final List<RecipeEntity> oldRecipelist;
  final bool isFirstFetch;

  RecipeLoading( this.oldRecipelist, {this.isFirstFetch = false});

  @override
  // TODO: implement props
  List<Object?> get props => [oldRecipelist];
}

class RecipeLoaded extends RecipeState {
  final List<RecipeEntity> recipeList;

  RecipeLoaded( this.recipeList);

  @override
  // TODO: implement props
  List<Object?> get props => [recipeList];
}

class RecipeError extends RecipeState {
  final String message;

  RecipeError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
