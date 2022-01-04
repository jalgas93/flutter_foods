import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/recipe_entity.dart';

abstract class RecipeRepository {
  Future<Either<Failure, List<RecipeEntity>>> findByRecipeId(int page);

  Future<Either<Failure, List<RecipeEntity>>> searchForRecipes(String query);
}
