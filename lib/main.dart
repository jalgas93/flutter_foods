import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/colors/appColors.dart';
import 'features/presentations/bloc/findbyidrecipe_cubit/recipe_cubit.dart';
import 'features/presentations/bloc/searchrecipe_bloc/search_bloc.dart';
import 'features/presentations/pages/recipe_screen.dart';
import 'package:flutter_food_repipe/locator_service.dart' as di;
import 'locator_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [

           BlocProvider<RecipeListCubit>(
               create: (context) => sl<RecipeListCubit>()..loadRecipe()),
            BlocProvider<SearchBloc>(
                create: (context) => sl<SearchBloc>()),

       ],
      child: MaterialApp(
        title: 'Flutter Demo',
          theme: ThemeData.dark().copyWith(
            backgroundColor: AppColors.mainBackground,
            scaffoldBackgroundColor: AppColors.mainBackground,
          ),
        home:  HomePage(),
      ),
    );
  }
}




