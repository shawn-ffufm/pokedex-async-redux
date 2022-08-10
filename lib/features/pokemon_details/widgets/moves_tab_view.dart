import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api_spec/model/moves_details.dart';
import 'package:pokedex/utils/strings.dart' as str;

class MovesTabView extends StatelessWidget {
  const MovesTabView({
    super.key,
    required this.details,
  });

  final MovesDetails? details;

  @override
  Widget build(BuildContext context) => const Center(child: Text(str.movesTitle));
}
