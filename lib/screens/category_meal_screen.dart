import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_items.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  final List<Meal> availableMeal;

  CategoryMealScreen({this.availableMeal});
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  String categoryId;
  List<Meal> categoryMeals;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArg['title'];
    categoryId = routeArg['id'];
    categoryMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: categoryMeals != null
          ? ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: (context, index) {
                return MealItems(
                  meal: categoryMeals[index],
                  removeItem: _removeMeal,
                );
              })
          : CircularProgressIndicator(),
    );
  }

  _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
}
