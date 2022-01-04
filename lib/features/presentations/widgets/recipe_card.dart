import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_repipe/features/domain/entities/recipe_entity.dart';

import '../../../common/colors/appColors.dart';
import '../pages/person_details_screen.dart';

class RecipeCard extends StatelessWidget {
  final RecipeEntity recipe;

  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonDetailsScreen(recipe: recipe),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [

            Container(
                width: 166,
                height: 166,
                child:Image.network( recipe.featured_image),

            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    recipe.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Text(
                          'fsdf',
                          style: TextStyle(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Last now location:',
                    style: TextStyle(color: AppColors.greyColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(recipe.description,
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Origin:',
                    style: TextStyle(color: AppColors.greyColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(recipe.publisher,
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


