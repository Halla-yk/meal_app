import 'package:flutter/material.dart';
import 'package:meals_app/screens/Category_meals_screen.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.color, this.title, this.id);

  void selectCategory(BuildContext ctx){
   Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName , arguments: { 'id' : id , 'title' : title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15), //تعني انه لما بدو يعمل ريبيلد ما رح يعمللها ريكرييت
        child: Text(title,style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [//لون تدريجي
          color.withOpacity(0.7),
          color,
        ], begin: Alignment.bottomLeft, end: Alignment.bottomRight)),
      ),
    );
  }
}
