import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/Category_meals_screen.dart';
import './screens/meal-detail-screen.dart';
import './screens/tabs_screen.dart';
import './screens/Filters_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.lime,
          accentColor: Colors.teal,
          canvasColor: Color.fromRGBO(247, 255, 198, 1),
          fontFamily: "Rubik",
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle( fontFamily: 'Rubik',color: Color.fromRGBO(30, 15, 250, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(fontSize: 20, fontFamily: 'Anton',fontWeight: FontWeight.bold))),
   //  home:  MyHomePage(),
      routes: {
        '/' : (ctx) => TabsScreen()// او بشيل الكومنت عن الهوم
       , CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen()
       , MealDetailSreen.routName : (ctx) => MealDetailSreen(),
         FiltersScreen.routeName : (ctx) => FiltersScreen()
      }, //160
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DeliMeals"),
        ),
        body: CategoriesScreen());
  }
}
