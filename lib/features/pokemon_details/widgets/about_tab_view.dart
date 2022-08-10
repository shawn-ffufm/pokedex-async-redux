import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_api_spec/model/about_details.dart';
import 'package:pokedex/utils/strings.dart' as str;

class AboutTabView extends StatelessWidget {
  const AboutTabView({
    super.key,
    required this.details,
  });
  final AboutDetails? details;
  @override
  Widget build(BuildContext context) => const Center(child: Text(str.aboutTitle));
}
