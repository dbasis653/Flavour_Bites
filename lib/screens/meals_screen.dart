// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:meals2/model/category_model.dart';
import 'package:meals2/model/meal_model.dart';
import 'package:meals2/widgets/meal_items.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
  });
  final List<MealModel> meals;

  final String? title;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) => MealItems(
        meal: meals[index],
      ),
    );

    if (meals.isEmpty) {
      content = const Center(
        child: Text(
          'Ohh...No Meal is added here',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: content,
    );
  }
}
