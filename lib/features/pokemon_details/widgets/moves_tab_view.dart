import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart' as str;

class MovesTabView extends StatelessWidget {
  const MovesTabView({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text(str.movesTitle));
}
