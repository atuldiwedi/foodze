import 'package:flutter/material.dart';
import 'package:foodze/screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';
import './Categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;

  List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': "Categories",
    },
    {"page": FavoritesScreen(), "title": "Favorites"}
  ];
  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectPageIndex,
        onTap: _selectPage,
        // type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}

// first approch
//  return DefaultTabController(
//       length: 2,
//       // initialIndex: 1,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(
//             tabs: <Widget>[
//               Tab(icon: Icon(Icons.category), text: "Categories"),
//               Tab(icon: Icon(Icons.star), text: "Favorites"),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[CategoriesScreen(), FavoritesScreen()],
//         ),
//       ),
//     );