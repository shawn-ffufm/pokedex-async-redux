import 'package:pokedex/api/pokedex_api_spec/model/pokemon.dart';
import 'package:pokedex/model/dto/pokemon_dto.dart';
import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;

extension StringManipulation on String {
  String get toCustomUrl => k.imageURL.replaceAll(str.indexReplace, split('/')[6]);

  int get getPokemonId => int.parse(split('/')[6]);
}

extension IntManipulation on int {
  String get getPokemonUrl => k.imageURL.replaceAll(str.indexReplace, toString());
}

extension PokemonDtoExt on Pokemon {
  PokemonDto toDto(int id) => PokemonDto(id: id, pokemon: this);
}
