import 'package:flutter/material.dart';
import './categories_screen.dart';
import './Favorites_screen.dart';
import '../widgets/main-drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // عدد ال tabs
        initialIndex: 0 // تعني انه الصفحة المبدئية هي الCategoriesScreen
        ,
        child: Scaffold(
          drawer: MainDrawer(),
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'All Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ]),
          ),
          body: TabBarView(
              children: <Widget>[CategoriesScreen(), FavoritesScreen()]//اول  tab  بياخد اول وحدة و هكذا بالترتيب
          ),


        ));
  }
}
