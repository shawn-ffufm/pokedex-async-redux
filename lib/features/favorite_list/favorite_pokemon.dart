import 'package:flutter/material.dart';
import 'package:pokedex/utils/constant.dart' as k;

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(k.favorites),
    );
  }
}
