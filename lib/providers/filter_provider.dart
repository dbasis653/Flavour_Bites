import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters { glutenFree, lectoseFree, vegetarianFree, veganFree }

class FilterProviderNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterProviderNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lectoseFree: false,
          Filters.vegetarianFree: false,
          Filters.veganFree: false,
        });

  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider =
    StateNotifierProvider<FilterProviderNotifier, Map<Filters, bool>>((ref) {
  return FilterProviderNotifier();
});
