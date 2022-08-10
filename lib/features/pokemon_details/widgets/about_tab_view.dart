import 'package:flutter/material.dart';
import 'package:pokedex/utils/strings.dart' as str;

class AboutTabView extends StatelessWidget {
  const AboutTabView({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text(str.aboutTitle));
}
