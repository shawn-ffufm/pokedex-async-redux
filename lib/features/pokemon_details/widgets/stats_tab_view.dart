import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart' as str;

class StatsTabView extends StatelessWidget {
  const StatsTabView({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text(str.statsTitle));
}
