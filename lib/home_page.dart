import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/pokemon_favorites/pokemon_favorites_connector.dart';
import 'package:pokedex/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;

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
        onTap: (index) => _onNavigateToTab(context, index, currentNavIndex),
        items: navBarItems,
      ),
    );
  }

  int _selectNavIndex(String routerLocation) {
    switch (routerLocation) {
      case PokemonListConnector.route:
        return k.counterZero;
      case PokemonFavoritesConnector.route:
        return k.counterOne;
      default:
        return k.counterZero;
    }
  }

  String _selectNavPath(int selectedTabIndex) {
    switch (selectedTabIndex) {
      case k.counterZero:
        return PokemonListConnector.route;
      case k.counterOne:
        return PokemonFavoritesConnector.route;
      default:
        return PokemonListConnector.route;
    }
  }

  void _onNavigateToTab(BuildContext context, int selectedTabIndex, int currentTabIndex) {
    if (currentTabIndex == selectedTabIndex) return;

    final navPath = _selectNavPath(selectedTabIndex);
    context.go(navPath);
  }
}
