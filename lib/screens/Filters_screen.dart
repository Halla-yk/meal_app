import 'package:flutter/material.dart';
import '../widgets/main-drawer.dart';
class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: MainDrawer(),//بدال زر الرجوع(فرضا انا هيك بدي)
      appBar: AppBar(
        title: Text(
          "your filters",
        ),
      ),
      body: Container(
        child: Text('filters'),
      ),
    );
  }
}
