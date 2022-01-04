import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_repipe/common/colors/appColors.dart';
import 'package:flutter_food_repipe/features/domain/entities/recipe_entity.dart';
import 'package:flutter_food_repipe/features/presentations/bloc/findbyidrecipe_cubit/recipe_cubit.dart';
import 'package:flutter_food_repipe/features/presentations/bloc/findbyidrecipe_cubit/recipe_state.dart';
import 'package:flutter_food_repipe/features/presentations/widgets/recipe_card.dart';

class RecipeList extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<RecipeListCubit>(context).loadRecipe();
          // context.read<RecipeListCubit>().loadRecipe();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<RecipeListCubit, RecipeState>(
      builder: (context, state) {
        List<RecipeEntity> recipe = [];
        bool isLoading = false;
        if (state is RecipeLoading && state.isFirstFetch) {
          return _loadingIndecator();
        } else if (state is RecipeLoading) {
          recipe = state.oldRecipelist;
          isLoading = true;
        } else if (state is RecipeLoaded) {
          recipe = state.recipeList;
        } else if (state is RecipeError) {
          return Text(
            state.message,
            style: TextStyle(fontSize: 25, color: Colors.white),
          );
        }
        return ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index < recipe.length) {
                return RecipeCard(recipe: recipe[index]);
              } else {
                Timer(Duration(milliseconds: 30), () {
                  scrollController
                      .jumpTo(scrollController.position.maxScrollExtent);
                });
                return _loadingIndecator();
              }
            },
            separatorBuilder: (contex, index) {
              return Divider(
                color: AppColors.greyColor,
              );
            },
            itemCount: recipe.length);
      },
    );
  }

  Widget _loadingIndecator() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
