import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/pokemon_favorites/favorite_connector.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_list_connector.dart';
import 'package:pokedex/utils/strings.dart' as str;

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final currentNavIndex = _selectNavIndex(router.location);
    final navBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        label: str.homeTitle,
        icon: Icon(Icons.home),
      ),
      const BottomNavigationBarItem(
        label: str.favoriteTitle,
        icon: Icon(Icons.favorite),
      ),
    ];

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        iconSize: 25,
        currentIndex: currentNavIndex,
        showUnselectedLabels: false,
        onTap: (index) => context.go(_onNavigateToTab(index, currentNavIndex)),
        items: navBarItems,
      ),
    );
  }

  int _selectNavIndex(String routerLocation) {
    switch (routerLocation) {
      case PokemonListConnector.route:
        return 0;
      case FavoriteConnector.route:
        return 1;
      default:
        return 0;
    }
  }

  String _selectNavPath(int selectedTabIndex) {
    switch (selectedTabIndex) {
      case 0:
        return PokemonListConnector.route;
      case 1:
        return FavoriteConnector.route;
      default:
        return PokemonListConnector.route;
    }
  }

  String _onNavigateToTab(int selectedTabIndex, int currentTabIndex) {
    if (currentTabIndex == selectedTabIndex) {
      return _selectNavPath(currentTabIndex);
    } else {
      return _selectNavPath(selectedTabIndex);
    }
  }
}
