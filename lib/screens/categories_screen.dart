import 'package:flutter/material.dart';
import '../dummy.dart';
import '../widgets/category_item.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children:
        DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.color,catData.title,catData.id)).toList() //استخدمنا ال map لتحويل  list من المعلومات ل list widgets
      ,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,// قديش كل item  رح تاخد من ال width تبع الشاشة
          childAspectRatio: 300/ 200,// height/width
          crossAxisSpacing: 20.0,//المسافة من اليمين او اليسار او اسفل و فوق
          mainAxisSpacing: 20.0),
    );
  }
}
