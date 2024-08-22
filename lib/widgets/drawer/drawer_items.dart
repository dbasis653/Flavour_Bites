import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTapDrawerItem});
  final String title;
  final Icon iconData;
  final void Function(String) onTapDrawerItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: iconData,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface, fontSize: 23),
      ),
      onTap: () {
        onTapDrawerItem(title);
      },
    );
  }
}
