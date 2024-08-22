import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals2/providers/filter_provider.dart';

import 'package:meals2/widgets/Filters/filter_items.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply Filter'),
      ),
      body: Column(
        children: [
          FilterItems(
            filterName: 'Gluten-Free',
            filterSubtitle: 'Gluten Free Meals Only',
            whatIsFree: activeFilter[Filters.glutenFree]!,
            filter: Filters.glutenFree,
          ),
          FilterItems(
            filterName: 'Lectose-Free',
            filterSubtitle: 'Lectose Free Meals Only',
            whatIsFree: activeFilter[Filters.lectoseFree]!,
            filter: Filters.lectoseFree,
          ),
          FilterItems(
            filterName: 'Vegetarian',
            filterSubtitle: 'Vegetarian Meals Only',
            whatIsFree: activeFilter[Filters.vegetarianFree]!,
            filter: Filters.vegetarianFree,
          ),
          FilterItems(
            filterName: 'Vegan',
            filterSubtitle: 'Vegan Meals Only',
            whatIsFree: activeFilter[Filters.veganFree]!,
            filter: Filters.veganFree,
          ),
        ],
      ),
    );
  }
}
