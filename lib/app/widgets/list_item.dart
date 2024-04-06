import 'package:flutter/material.dart';
import 'package:rivinha_fitness/theme/my_colors.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {super.key, this.onTap, required this.title, required this.description});

  final void Function()? onTap;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        child: ListTile(
          title: Text(title),
          subtitle: Text(description,
              style: const TextStyle(color: MyColors.gray100)),
          trailing: Icon(Icons.adaptive.arrow_forward),
        ),
      ),
    );
  }
}
