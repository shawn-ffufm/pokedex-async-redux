import 'package:pokedex/model/dto/pokemon_dto.dart';

typedef PokemonList = List<PokemonDto>;
typedef OnSelectPokemon = Function(PokemonDto selectedPokemon);
typedef AboutDetails = Map<String, String>;
typedef StatsDetails = List<String>;
