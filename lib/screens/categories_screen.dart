import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: Text(
            'Meals',
          ),
        ),
      body: GridView(
        padding: EdgeInsets.all(25.0),
        children: DUMMY_CATEGORIES
            .map(
              (e) => CategoryItem(
                id: e.id,
                title: e.title,
                color: e.color,
              ),
            ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200,
        ),
      ),
    );
  }
 
}
