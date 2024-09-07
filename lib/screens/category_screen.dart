// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:meals2/model/category_model.dart';
import 'package:meals2/widgets/grid_items.dart';
import 'package:meals2/model/meal_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {super.key, required this.categories, required this.filteredList});
  final List<CategoryModel> categories;

  final List<MealModel> filteredList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:

      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: [
          for (final category in categories)
            GridItems(
              category: category,
              filteredList: filteredList,
            )
        ],
      ),
    );
  }
}
