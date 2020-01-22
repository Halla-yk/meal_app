import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal-detail-screen.dart';
class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.id,
        @required this.title,
      @required this.affordability,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity});

  String get complexityText{
    switch (complexity){
      case Complexity.Simple:
        return "simple";
        break;
      case Complexity.Challenging:
        return "challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }

  }

  String get affordabilityText{
    switch (affordability){
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Excpencive";
        break;
      default:
        return "Unknown";
    }

  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailSreen.routName, arguments: id);//بحط اسم الصفحة اللي بدي اروح عليها وشو هي ال  data  اللي بدها اياها
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        //  ClipRRect بس ال card بتدعم ال shape اما ال  stack ما بتدعمه اعلشان هيك استخدمنا
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: 300,
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      )
                     ,Text('$duration min'),
                    ],

                  ),
                 Row(
                 children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                      width: 6,
                        )
                     ,Text(complexityText),
                       ]),
                  Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        )
                        ,Text(affordabilityText),
                      ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}