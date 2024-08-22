import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals2/providers/favorite_provider.dart';
import 'package:meals2/providers/filter_provider.dart';

import 'package:meals2/screens/category_screen.dart';
import 'package:meals2/screens/meals_screen.dart';
import 'package:meals2/screens/filter_screen.dart';

import 'package:meals2/data/dummy_data.dart';
import 'package:meals2/widgets/drawer/main_drawer.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int activePageIndex = 0;

  void onTapNavigation(int index) {
    setState(() {
      // activeScreen = MealsScreen(meals: favMeals);
      activePageIndex = index;
    });
  }

  void onTapDrawerItem(String identifier) async {
    Navigator.pop(context);

    if (identifier == 'Filters') {
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(builder: (ctx) => const FilterScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(filterProvider);

    final filteredList = dummyMeals.where((meal) {
      if (filters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (filters[Filters.lectoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (filters[Filters.vegetarianFree]! && !meal.isVegetarian) {
        return false;
      }
      if (filters[Filters.veganFree]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    String pageTitle = 'Categories';
    Widget activeScreen = CategoryScreen(
      categories: availableCategories,
      filteredList: filteredList,
    );
    if (activePageIndex == 1) {
      final favList = ref.watch(favoriteProvider);
      pageTitle = 'Favorites';
      activeScreen = MealsScreen(
        meals: favList,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      drawer: MainDrawer(
        onTapDrawerItem: onTapDrawerItem,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activePageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Favorites',
          ),
        ],
        onTap: (index) {
          onTapNavigation(index);
        },
      ),
      body: activeScreen,
    );
  }
}
