import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  SearchEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RecipeSearch extends SearchEvent {
  final String query;

  RecipeSearch(this.query);
}
