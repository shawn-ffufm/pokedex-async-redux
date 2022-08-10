import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api_spec/model/stats_details.dart';
import 'package:pokedex/utils/strings.dart' as str;

class StatsTabView extends StatelessWidget {
  const StatsTabView({
    super.key,
    required this.details,
  });

  final StatsDetails? details;

  @override
  Widget build(BuildContext context) => const Center(child: Text(str.statsTitle));
}
