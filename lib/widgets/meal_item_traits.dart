import 'package:flutter/material.dart';
import 'package:meals2/model/meal_model.dart';

class MealItemTraits extends StatelessWidget {
  const MealItemTraits({super.key, required this.meal});
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.timelapse_outlined),
        const SizedBox(width: 5),
        Text(
          '${meal.duration.toString()} min',
          style: const TextStyle(color: Colors.white),
        ),
        const Spacer(),
        const Icon(Icons.workspace_premium_sharp),
        const SizedBox(width: 5),
        Text(
          meal.complexity.name,
          style: const TextStyle(color: Colors.white),
        ),
        const Spacer(),
        const Icon(Icons.attach_money_sharp),
        const SizedBox(width: 5),
        Text(
          meal.affordability.name,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
