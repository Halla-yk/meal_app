import 'package:flutter/material.dart';
import '../dummy.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static final routeName = '/category-meal';

//  final String categoryTitle;
//  final String id;
//
//  CategoryMealsScreen(this.categoryTitle,this.id);
  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];

    final List<Meal> categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList(); //وظيفتها انها بتشوف كل عنصر في ال  DUMMY_MEALS  الي هو (meal) و بتنفذ عليه ال method  و الي بترجع true بتحطها بال list  الجديدة الي هي  categoryMeals
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            imageUrl: categoryMeals[index].imageUrl,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
          );
        },
        itemCount: categoryMeals.length,
      ),
      //هادي ال ميثود ح يتم استدعائها لكل item في ال list
    );
  }
}
