import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SortMenu extends StatelessWidget {
  const SortMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        // You can handle sorting logic here in the future
        print("Selected: $value");
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "name",
          child: Text("Sort by Name"),
        ),
        PopupMenuItem(
          value: "calories",
          child: Text("Sort by Calories"),
        ),
        PopupMenuItem(
          value: "time",
          child: Text("Sort by Time"),
        ),
      ],
      icon: Icon(
        FontAwesomeIcons.sort,
        color: Colors.black,
      ),
    );
  }
}
