import 'package:flutter_food_repipe/core/platforms/network_info.dart';
import 'package:flutter_food_repipe/features/data/datasources/recipe_local_data_source.dart';
import 'package:flutter_food_repipe/features/data/datasources/recipe_remote_data_source.dart';
import 'package:flutter_food_repipe/features/data/repositories/recipe_repository_impl.dart';
import 'package:flutter_food_repipe/features/domain/repositories/recipe_repository.dart';
import 'package:flutter_food_repipe/features/domain/usecases/find_by_recipe_id.dart';
import 'package:flutter_food_repipe/features/domain/usecases/search_for_recipes.dart';
import 'package:flutter_food_repipe/features/presentations/bloc/findbyidrecipe_cubit/recipe_cubit.dart';
import 'package:flutter_food_repipe/features/presentations/bloc/searchrecipe_bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
//Bloc//Cubit
  sl.registerFactory(() => SearchBloc(searchForRecipes: sl()));
  sl.registerFactory(() => RecipeListCubit(findByRecipeId: sl()));

//UseCase,
  sl.registerLazySingleton(() => FindByRecipeId(sl()));
  sl.registerLazySingleton(() => SearchForRecipes(sl()));

//Repository
  sl.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImple(
      recipeLocalDataSource: sl(),
      recipeRemoteDataSource: sl(),
      networkInfo: sl()));

  sl.registerLazySingleton<RecipeLocalDataSource>(
      () => RecipeLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RecipeRemoteDataSource>(
      () => RecipeRemoteDataSourceImpl(client: sl()));

//Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//External
  final sharedPrefereces = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefereces);
  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
