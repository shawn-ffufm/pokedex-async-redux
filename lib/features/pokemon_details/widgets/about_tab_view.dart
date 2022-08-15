import 'package:flutter/material.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/utils/strings.dart' as str;

class AboutTabView extends StatelessWidget {
  const AboutTabView({
    super.key,
    required this.details,
  });

  final PokemonDto details;

  @override
  Widget build(BuildContext context) => const Center(child: Text(str.aboutTitle));
}
