import 'package:flutter/material.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';

class AboutTabView extends StatelessWidget {
  const AboutTabView({
    super.key,
    required this.details,
  });

  final PokemonDto details;

  @override
  Widget build(BuildContext context) {
    /// TODO: This will be improved once loading is implemented
    final height = details.height == 0 ? '' : details.height.toString();

    return Center(child: Text(height));
  }
}
