import 'package:flutter/material.dart';
import 'package:meals2/model/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals2/widgets/meal_item_traits.dart';
import 'package:meals2/screens/meal_details_screen.dart';

class MealItems extends StatelessWidget {
  const MealItems({super.key, required this.meal});
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    void onTapMeal(BuildContext context, MealModel meal) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MealDetailsScreen(
            meal: meal,
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        onTapMeal(context, meal);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: const EdgeInsets.all(5),
          // elevation: 20,
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 5),
                      MealItemTraits(meal: meal),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
