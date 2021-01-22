import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_items.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: categoryMeals!=null?ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return MealItems(
              meal: categoryMeals[index],
     
            );
          }):CircularProgressIndicator(),
    );
  }
}
