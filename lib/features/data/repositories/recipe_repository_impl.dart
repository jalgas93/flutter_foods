import 'package:dartz/dartz.dart';
import 'package:flutter_food_repipe/core/errors/exeptions.dart';
import 'package:flutter_food_repipe/core/errors/failure.dart';
import 'package:flutter_food_repipe/features/data/datasources/recipe_local_data_source.dart';
import 'package:flutter_food_repipe/features/data/datasources/recipe_remote_data_source.dart';
import 'package:flutter_food_repipe/features/data/models/recipe_model.dart';
import 'package:flutter_food_repipe/features/domain/entities/recipe_entity.dart';
import 'package:flutter_food_repipe/features/domain/repositories/recipe_repository.dart';

import '../../../core/platforms/network_info.dart';

class RecipeRepositoryImple implements RecipeRepository {
  final RecipeLocalDataSource recipeLocalDataSource;
  final RecipeRemoteDataSource recipeRemoteDataSource;
  final NetworkInfo networkInfo;

  RecipeRepositoryImple( {required this.recipeLocalDataSource,required this.recipeRemoteDataSource,
     required this.networkInfo});

  @override
  Future<Either<Failure, List<RecipeEntity>>> findByRecipeId(int page) async {
    return await _getrecipe(() {
      return recipeRemoteDataSource.findByRecipeId(page);
    });
  }

  @override
  Future<Either<Failure, List<RecipeEntity>>> searchForRecipes(
      String query) async {
    // TODO: implement searchForRecipes
    return await _getrecipe(() {
     return recipeRemoteDataSource.searchForRecipes(query);
    });
  }

  Future<Either<Failure, List<RecipeModel>>> _getrecipe(
      Future<List<RecipeModel>> Function() getRecipe) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRecipe = await getRecipe();
        recipeLocalDataSource.recipeToCache(remoteRecipe);
        return Right(remoteRecipe);
      } on ServerExeption {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localRecipe = await recipeLocalDataSource
            .getLastRecipeFromCache();
        return Right(localRecipe);
      } on CacheExeption {
        return Left(CacheFailure());
      }
    }
  }
}



