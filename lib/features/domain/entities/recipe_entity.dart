import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final int pk;
  final String title;
  final String publisher;
  final String featured_image;
  final int rating;
  final String source_url;
  final String description;
  final Null cooking_instructions;
  final List<String> ingredients;
  final String date_added;
  final String date_updated;
  final int long_date_added;
  final int long_date_updated;

  RecipeEntity({
    required this.pk,
    required this.title,
    required this.publisher,
    required this.featured_image,
    required this.rating,
    required this.source_url,
    required this.description,
    required this.cooking_instructions,
    required this.ingredients,
    required this.date_added,
    required this.date_updated,
    required this.long_date_added,
    required this.long_date_updated
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        pk,
        title,
        publisher,
        featured_image,
        rating,
        source_url,
        description,
        cooking_instructions,
        ingredients,
        date_added,
        date_updated,
        long_date_added,
        long_date_updated
      ];
}
