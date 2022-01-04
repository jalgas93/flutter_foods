import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_repipe/core/errors/failure.dart';
import 'package:flutter_food_repipe/features/domain/entities/recipe_entity.dart';
import 'package:flutter_food_repipe/features/domain/repositories/recipe_repository.dart';

import '../../../core/usecase/usecase.dart';

class FindByRecipeId extends UseCase<List<RecipeEntity>,PageRecipeParams>{
  final RecipeRepository recipeRepository;

  FindByRecipeId(this.recipeRepository);

  @override
  Future<Either<Failure, List<RecipeEntity>>> call(PageRecipeParams params) async{
    // TODO: implement call
    return await recipeRepository.findByRecipeId(params.page);
  }
}

class PageRecipeParams extends Equatable{
  final int page;

  PageRecipeParams({required this.page});
  @override
  // TODO: implement props
  List<Object?> get props => [page];

}