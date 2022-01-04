import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_repipe/core/errors/failure.dart';
import 'package:flutter_food_repipe/features/domain/entities/recipe_entity.dart';
import 'package:flutter_food_repipe/features/domain/usecases/find_by_recipe_id.dart';
import 'package:flutter_food_repipe/features/presentations/bloc/findbyidrecipe_cubit/recipe_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server failure';
const CACHE_FAILURE_MESSAGE = 'Cache failure';

class RecipeListCubit extends Cubit<RecipeState> {
  final FindByRecipeId findByRecipeId;

  RecipeListCubit({required this.findByRecipeId}) : super(RecipeEmpty());

  int page = 1;
  void loadRecipe() async {
    if (state is RecipeLoading) return;


    final currentState = state;
    var oldRecipe = <RecipeEntity>[];
    if (currentState is RecipeLoaded) {
      oldRecipe = currentState.recipeList;
    }

    emit(RecipeLoading(oldRecipe, isFirstFetch: page == 1));

    final failureOrRecipe = await findByRecipeId(PageRecipeParams(page: page));
    failureOrRecipe.fold((error) => emit(RecipeError(message: _mapFailureToMessage(error))), (recipe) {
      page++;
      final recipes = (state as RecipeLoading).oldRecipelist;
      recipes.addAll(recipe);
      print('List length:${recipes.length.toString()}');
      emit(RecipeLoaded( recipes));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return CACHE_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
