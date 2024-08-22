import 'package:flutter/material.dart';
import 'package:meals2/widgets/drawer/drawer_items.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onTapDrawerItem});
  final void Function(String) onTapDrawerItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Row(
            children: [
              const Icon(Icons.restaurant),
              const SizedBox(width: 10),
              Text('Cooking Up !!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white)),
            ],
          )),
          DrawerItems(
            title: 'Meals',
            iconData: const Icon(Icons.dining),
            onTapDrawerItem: onTapDrawerItem,
          ),
          DrawerItems(
            title: 'Filters',
            iconData: const Icon(Icons.filter_alt_outlined),
            onTapDrawerItem: onTapDrawerItem,
          ),
        ],
      ),
    );
  }
}
