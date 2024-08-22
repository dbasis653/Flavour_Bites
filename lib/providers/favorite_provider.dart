import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals2/model/meal_model.dart';

class FavoriteProviderNotifier extends StateNotifier<List<MealModel>> {
  FavoriteProviderNotifier() : super([]);

  bool setFavorite(MealModel meal) {
    final isfav = state.contains(meal);
    if (isfav) {
      state = state.where((m) => m.id != meal.id).toList();
      return true;
    } else {
      state = [...state, meal];
      return false;
    }
  }
}

final favoriteProvider =
    StateNotifierProvider<FavoriteProviderNotifier, List<MealModel>>((ref) {
  return FavoriteProviderNotifier();
});
