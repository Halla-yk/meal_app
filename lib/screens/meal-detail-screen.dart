import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dummy.dart';

class MealDetailSreen extends StatelessWidget {
  static const routName = '/meal-detail';

  Widget buildSectionTitle(
    BuildContext context,
    String text,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.grey)),
      height: 150,
      width: 250,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                child: Image.network(
                  selectMeal.imageUrl,
                  fit: BoxFit.fill,
                ),
                height: (MediaQuery.of(context).size.height * 0.3),// ال  MediaQuery  لحجم الجهاز
                width: double.infinity),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectMeal.ingredients[index],
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                color: Theme.of(context).accentColor,
              ),
              itemCount: selectMeal.ingredients.length,
            )),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      title:Text( selectMeal.steps[index]),
                          leading: CircleAvatar(
                            child: Text('${(index + 1)}'),

                          ),
                        ),
                 Divider() ],

                ),itemCount: selectMeal.steps.length,
            ))
          ],
        ),
      ),
      appBar: AppBar(title: Text('$mealId')),
    );
  }
}
