import 'package:flutter/material.dart';
import 'package:meal_app/constants/constants.dart';
import 'package:meal_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(8),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meal', Icons.restaurant, () {
            Navigator.pop(context);
          }),
          buildListTile('Filters', Icons.settings, () {
          var routeName=  ModalRoute.of(context).settings.name;

            if (routeName==FilterScreen.routeName) {
              Navigator.pop(context);
            } else {
               Navigator.of(context).pushNamed(FilterScreen.routeName);
            }
         
          }),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: ralewayFont,
        ),
      ),
    );
  }
}
