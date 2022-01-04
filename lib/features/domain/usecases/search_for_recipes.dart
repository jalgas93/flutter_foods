

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_repipe/core/errors/failure.dart';
import 'package:flutter_food_repipe/core/usecase/usecase.dart';
import 'package:flutter_food_repipe/features/domain/entities/recipe_entity.dart';
import 'package:flutter_food_repipe/features/domain/repositories/recipe_repository.dart';

class SearchForRecipes extends UseCase<List<RecipeEntity>,SearchRecipeParams>{
 final RecipeRepository recipeRepository;

  SearchForRecipes(this.recipeRepository);
  @override
  Future<Either<Failure, List<RecipeEntity>>> call(SearchRecipeParams params) async{

    // TODO: implement call
    return await recipeRepository.searchForRecipes(params.query);
  }

}

class SearchRecipeParams extends Equatable{
  final String query;

  SearchRecipeParams({required this.query});
  @override
  // TODO: implement props
  List<Object?> get props => [query];

}