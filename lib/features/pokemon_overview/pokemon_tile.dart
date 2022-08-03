import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonTile extends StatefulWidget {
  const PokemonTile({Key? key}) : super(key: key);

  @override
  State<PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const Text(
              str.nameFiller,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Column(
                  children: const [
                    Text(
                      str.typeFiller,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      str.typeFiller,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.catching_pokemon,
                  size: 100,
                )
              ],
            ),
          ],
        ),
      ),
      onTap: () => context.pop(),

      /// TODO: on tap should redirect and display the details of the pokemon
    );
  }
}
