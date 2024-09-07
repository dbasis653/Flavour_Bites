import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals2/providers/favorite_provider.dart';

import 'package:meals2/model/meal_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals2/widgets/meal_item_traits.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final MealModel meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favMeals = ref.watch(favoriteProvider);
    bool isFav = favMeals.contains(meal);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text(
          meal.title,
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoriteProvider.notifier).setFavorite(meal);
            },
            // icon: const Icon(Icons.favorite),
            icon: (isFav
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Stack(
                children: [
                  FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meal.imageUrl),
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
                          MealItemTraits(meal: meal),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Card(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        'Ingredients:',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 150,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              for (final ingredient in meal.ingredients)
                                // for (int i = 0; i < meal.ingredients.length; i++)
                                Text(
                                  ingredient,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Steps:',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              for (final step in meal.steps)
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text(
                            step,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                        ],
                      ),
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
