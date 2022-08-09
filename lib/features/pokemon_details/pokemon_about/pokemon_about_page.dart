import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart' as str;

class PokemonAboutPage extends StatelessWidget {
  const PokemonAboutPage({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text(str.aboutTitle));
}
