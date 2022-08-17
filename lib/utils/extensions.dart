import 'package:pokedex/api/pokedex_api_spec/model/pokemon.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;
import 'package:pokedex/utils/typedefs.dart';

extension StringManipulation on String {
  String get toCustomUrl => k.imageURL.replaceAll(str.indexReplace, split('/')[6]);

  int get getPokemonId => int.parse(split('/')[6]);
}

extension PokemonExt on Pokemon {
  PokemonDto toDto(int id) => PokemonDto(id: id, pokemon: this);
}

extension PokemonDtoExt on PokemonDto {
  AboutDetails get toAboutDetails {
    final height = this.height == 0 ? '' : '${this.height.toString()} m';
    final weight = this.weight == 0 ? '' : '${this.weight.toString()} kg';
    final abilities = this.abilities.map((about) => about.ability?.name ?? '').join(', ');
    final baseExperience = this.baseExperience == 0 ? '' : '${this.baseExperience.toString()} xp';

    return {
      '${str.heightTitle} : ': height,
      '${str.weightTitle} : ': weight,
      '${str.abilitiesTitle} : ': abilities,
      '${str.baseExperienceTitle} : ': baseExperience,
    };
  }
}
