import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/provider/pokemon_provider.dart';

class PokemonListViewModel extends ChangeNotifier {
  final PokemonProvider _pokemonProvider = PokemonProvider();
  bool isLoading = false;


  List<Pokemon> get pokemonList => _pokemonProvider.pokemonList;

  Future<void> add() async {
    isLoading = true;
    await _pokemonProvider.addPokemon();
    isLoading = false;
    notifyListeners();
  }
}
