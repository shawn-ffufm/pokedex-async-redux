import 'package:flutter/material.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';

class StatsTabView extends StatelessWidget {
  const StatsTabView({
    super.key,
    required this.details,
  });

  final PokemonDto details;

  @override
  Widget build(BuildContext context) {
    /// TODO: This will be improved once loading is implemented
    final stats = details.stats.isEmpty ? '' : details.stats[0].stats!.name;

    return Center(child: Text(stats));
  }
}
