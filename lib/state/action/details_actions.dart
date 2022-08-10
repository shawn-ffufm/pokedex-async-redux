import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/api_service.dart';
import 'package:pokedex/state/app_state.dart';

class GetPokemonAction extends ReduxAction<AppState> {
  GetPokemonAction({required this.id});
  final String id;
  @override
  Future<AppState> reduce() async {
    final pokemonResponse = await ApiService().pokemonApi.getPokemon(id);
    return state.copyWith(pokemonDetails: pokemonResponse);
  }
}
