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
    String? abilities = '';
    final baseExperience = details.baseExperience == 0 ? '' : '${details.baseExperience.toString()} xp';
    if (details.abilities.isNotEmpty) {
      for (var i = 0; i < details.abilities.length; i++) {
        if (i == 0) {
          abilities = details.abilities[i].ability?.name;
        } else {
          abilities = '$abilities, ${details.abilities[i].ability?.name}';
        }
      }
    } else {
      abilities = '';
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 150.0,
                    child: Text(
                      str.heightTitle,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                    child: Text(
                      height,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const SizedBox(
                    width: 150.0,
                    child: Text(
                      str.weightTitle,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                    child: Text(
                      weight,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const SizedBox(
                    width: 150.0,
                    child: Text(
                      str.abilitiesTitle,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
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
                  const SizedBox(
                    width: 150.0,
                    child: Text(
                      str.baseExperienceTitle,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                    child: Text(
                      baseExperience,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
