import 'package:flutter/material.dart';
import 'package:meals2/model/category_model.dart';
import 'package:meals2/model/meal_model.dart';
import 'package:meals2/screens/meals_screen.dart';

class GridItems extends StatelessWidget {
  const GridItems(
      {super.key, required this.category, required this.filteredList});
  final CategoryModel category;
  final List<MealModel> filteredList;

  void _selectCategory(BuildContext context, CategoryModel category) {
    final filteredMeals = filteredList
        .where(
          (test) => test.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: filteredMeals,
          // category: category,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectCategory(context, category);
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.9),
              category.color.withOpacity(0.3),
            ],
          ),
        ),
        child: Text(
          category.title,
          // style: TextStyle(color: Colors.white),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
