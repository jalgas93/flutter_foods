import 'package:equatable/equatable.dart';
import 'package:flutter_food_repipe/features/domain/entities/recipe_entity.dart';

abstract class SearchState extends Equatable {
  SearchState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchStateEmpty extends SearchState {}

class SearchStateLoading extends SearchState {}

class SearchStateLoaded extends SearchState {
  final List<RecipeEntity> recipe;

  SearchStateLoaded(this.recipe);

  @override
  // TODO: implement props
  List<Object?> get props => [recipe];
}

class SearchStateError extends SearchState {
  final String message;

  SearchStateError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
