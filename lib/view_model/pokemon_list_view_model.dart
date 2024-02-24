import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/repositories/pokemon_repository.dart';

class PokemonListViewModel {
  final List<Pokemon> _pokemonList = [];
  bool isLoading = false;
  int pokemonId = 0;

  List<Pokemon> get pokemonList => _pokemonList;

  Future<void> add() async {
    isLoading = true;
    var pokemonDataSource = PokemonRepository();
    pokemonId = getPokemonId();
    var pokemon = await pokemonDataSource.getPokemon(pokemonId);
    _pokemonList.add(pokemon);
    isLoading = false;
  }

  int getPokemonId() {
    return pokemonId += 1;
  }
}
