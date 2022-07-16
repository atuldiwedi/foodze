import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    bool glutenFree = false;
    bool vegetarian = false;
    bool vegan = false;
    bool lactoseFree = false;

    Widget _buildSwitchListTile(
      String title,
      String description,
      bool currentValue,
      Function(bool) updateValue,
    ) {
      return SwitchListTile(
        value: currentValue,
        title: Text(title),
        subtitle: Text(description),
        onChanged: updateValue,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filter"),
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Adjust your meal selection.",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  "Gluten-free", "only include gluten-free", glutenFree,
                  (newValue) {
                setState(() {
                  glutenFree = newValue;
                });
              })
            ],
          ),
        )
      ]),
    );
  }
}
