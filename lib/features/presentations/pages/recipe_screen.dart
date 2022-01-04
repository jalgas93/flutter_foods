
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../common/colors/appColors.dart';
import '../widgets/recipe_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Foods',
          style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              backgroundColor: AppColors.mainBackground),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search), color: Colors.white)
        ],
      ),
      body: RecipeList(),
    );
  }
}
