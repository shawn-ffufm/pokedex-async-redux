import 'package:flutter/material.dart';
import 'package:pokedex/features/favorite_list/favorite_pokemon.dart';
import 'package:pokedex/features/pokemon_list/pokemon_list_page.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final screens = [
    const PokemonListPage(),
    const FavoritePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          iconSize: 25,
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              label: str.pokedexTitle,
              icon: ImageIcon(AssetImage(k.homeIcon)),
            ),
            BottomNavigationBarItem(
              label: str.favoriteTitle,
              icon: ImageIcon(AssetImage(k.favoriteIcon)),
            ),
          ],
        ),
      );
}
