import 'package:flutter/material.dart';
import 'package:rick_and_morty/src/ui/characters/pages/characters_screen.dart';
import 'package:rick_and_morty/src/ui/locations/pages/locations_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  final _pages = [const CharactersScreen(), const LocationsScreen()];

  void _selectPage(int index) {
    setState(
      () {
        _selectedPageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_selectedPageIndex == 0 ? 'Characters' : 'Locations'),
      ),
      body: IndexedStack(
        index: _selectedPageIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Characters",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Locations",
          ),
        ],
      ),
    );
  }
}
