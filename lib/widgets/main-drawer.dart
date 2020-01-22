import 'package:flutter/material.dart';
import '../screens/Filters_screen.dart';
class MainDrawer extends StatelessWidget {

  Widget buildListTile(String text,IconData iconData,Function function){

    return  ListTile(//ممكن احطها ب widget لحال بنفس الفايل علشان بينهم ترابط

      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24),
      ),
      onTap: function,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');//علشان يعمل replace  للصفحة بصفحة تانية بدال متتعبا ال stack
          }),
          buildListTile('Filters', Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
