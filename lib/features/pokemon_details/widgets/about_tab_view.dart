import 'package:dartx/dartx.dart';
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
  Widget build(BuildContext context) {
    /// TODO: This will be improved once loading is implemented
    final height = details.height == 0 ? '' : '${details.height.toString()} m';
    final weight = details.weight == 0 ? '' : '${details.weight.toString()} kg';
    final baseExperience = details.baseExperience == 0 ? '' : '${details.baseExperience.toString()} xp';
    String? abilities = '';
    for (var i = 0; i < details.abilities.length; i++) {
      if (i == 0) {
        abilities = details.abilities[i].ability?.name;
      } else {
        abilities = '$abilities, ${details.abilities[i].ability?.name}';
      }
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _makeSizedBox(str.heightTitle),
                _makeSizedBox(height),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                _makeSizedBox(str.weightTitle),
                _makeSizedBox(weight),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                _makeSizedBox(str.abilitiesTitle),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        abilities ?? '',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                _makeSizedBox(str.baseExperienceTitle),
                _makeSizedBox(baseExperience),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _makeSizedBox(String text) => SizedBox(
        width: 150.0,
        child: Text(
          text.capitalize(),
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        ),
      );
}
