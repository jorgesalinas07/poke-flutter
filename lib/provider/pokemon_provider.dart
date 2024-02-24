import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/repositories/pokemon_repository.dart';

class PokemonProvider {
  final List<Pokemon> _pokemonList = [];
  int pokemonId = 0;

  List<Pokemon> get pokemonList => _pokemonList;

  Future<void> addPokemon() async {
    var pokemonDataSource = PokemonRepository();
    pokemonId = getPokemonId();
    var pokemon = await pokemonDataSource.getPokemon(pokemonId);
    _pokemonList.add(pokemon);
  }

  int getPokemonId() {
    return pokemonId += 1;
  }

  Future<Pokemon> getPokemonById(int id) async {
    var pokemonDataSource = PokemonRepository();
    var pokemon = await pokemonDataSource.getPokemon(id);
    return pokemon;
  }
}
