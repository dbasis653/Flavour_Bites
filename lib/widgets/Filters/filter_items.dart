import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals2/providers/filter_provider.dart';

class FilterItems extends ConsumerWidget {
  const FilterItems({
    super.key,
    required this.filterName,
    required this.filterSubtitle,
    required this.whatIsFree,
    required this.filter,
  });

  final String filterName;
  final String filterSubtitle;
  final bool whatIsFree;
  final Filters filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
        value: whatIsFree,
        title: Text(filterName),
        subtitle: Text(filterSubtitle),
        onChanged: (isChecked) {
          ref.read(filterProvider.notifier).setFilter(filter, isChecked);
        });
  }
}
