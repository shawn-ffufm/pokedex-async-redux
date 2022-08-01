import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final currentNavIndex = _selectNavIndex(router.location);
    final navBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        label: str.pokedexTitle,
        icon: ImageIcon(AssetImage(k.homeIcon)),
      ),
      const BottomNavigationBarItem(
        label: str.favoriteTitle,
        icon: ImageIcon(AssetImage(k.favoriteIcon)),
      ),
    ];

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        iconSize: 25,
        currentIndex: currentNavIndex,
        showUnselectedLabels: false,
        onTap: (index) => _onNavigateToTab(index, currentNavIndex),
        items: navBarItems,
      ),
    );
  }

  int _selectNavIndex(String routerLocation) {
    switch (routerLocation) {
      case k.pokemonRoute:
        return 0;
      case k.favoriteRoute:
        return 1;
      default:
        return 0;
    }
  }

  String _selectNavPath(int selectedTabIndex) {
    switch (selectedTabIndex) {
      case 0:
        return k.pokemonRoute;
      case 1:
        return k.favoriteRoute;
      default:
        return k.pokemonRoute;
    }
  }

  void _onNavigateToTab(int selectedTabIndex, int currentTabIndex) {
    if (currentTabIndex == selectedTabIndex) return;

    final navPath = _selectNavPath(selectedTabIndex);
    context.go(navPath);
  }
}
