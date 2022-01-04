import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_repipe/features/domain/usecases/search_for_recipes.dart';
import 'package:flutter_food_repipe/features/presentations/bloc/findbyidrecipe_cubit/recipe_state.dart';
import 'package:flutter_food_repipe/features/presentations/bloc/searchrecipe_bloc/search_event.dart';
import 'package:flutter_food_repipe/features/presentations/bloc/searchrecipe_bloc/search_state.dart';

import '../../../../core/errors/failure.dart';

const SERVER_FAILURE_MESSAGE = 'Server failure';
const CACHED_FAILURE_MESSAGE = 'cached failure';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchForRecipes searchForRecipes;

  SearchBloc({required this.searchForRecipes}) : super(SearchStateEmpty());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is RecipeSearch) {
      yield* _mapFetchRecipeToState(event.query);
    }
  }

  Stream<SearchState> _mapFetchRecipeToState(String query) async* {
    yield SearchStateLoading();
    final failureOrRecipe =
        await searchForRecipes(SearchRecipeParams(query: query));

    yield failureOrRecipe.fold(
        (failure) => SearchStateError(
              message: _mapFailureToMessage(failure),
            ),
        (recipe) => SearchStateLoaded(recipe));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
