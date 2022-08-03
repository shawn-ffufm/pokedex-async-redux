import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(str.pokedexTitle),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(20, (index) {
            return GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Stack(
                  children: const [
                    Positioned(
                      left: 5,
                      top: 5,
                      child: Text(
                        str.nameFiller,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.catching_pokemon,
                        size: 120,
                      ),
                    ),
                    Positioned(
                      left: 5,
                      bottom: 100,
                      child: Text(
                        str.typeFiller,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      bottom: 70,
                      child: Text(
                        str.typeFiller,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
