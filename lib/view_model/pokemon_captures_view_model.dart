import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pokemon_app/model/pokemon_captures_model.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/provider/pokemon_provider.dart';
import 'package:pokemon_app/utils/file_storage_utils.dart';

class PokemonCapturesViewModel extends ChangeNotifier {
  final PokemonProvider _pokemonProvider = PokemonProvider();
  final List<PokemonCapturesModel> _pokemonsCaptures = [];
  List<PokemonCapturesModel> get pokemonCaptures => _pokemonsCaptures;
  bool isLoading = false;

  PokemonCapturesViewModel() {
    isLoading = true;
    notifyListeners();
    loadPokemonsCaptures();
  }

  void loadPokemonsCaptures() async {
    try {
      List<String> pokemonsDirs =
          await FileSystemUtils.getExternalDirectoriesList();
      _loadPokemonsCapturesModel(pokemonsDirs);
    } catch (e) {}
  }

  void _loadPokemonsCapturesModel(List<String> pokemonsDirs) async {
    for (var pokemonDir in pokemonsDirs) {
      String pokemonFolderName = basename(pokemonDir);
      if (!pokemonFolderName.contains('pokemon_id_')) return;
      String pokemonId = pokemonFolderName.split('pokemon_id_')[1];
      Pokemon pokemon =
          await _pokemonProvider.getPokemonById(int.parse(pokemonId));
      List<String> pokemonsCapturePaths =
          await FileSystemUtils.getExternalFolderList(pokemonFolderName);
      _pokemonsCaptures.add(
        PokemonCapturesModel(
          pokemon: pokemon,
          captures: pokemonsCapturePaths,
        ),
      );
      isLoading = false;
      notifyListeners();
    }
    isLoading = false; // Avoid repetition in future ticket
    notifyListeners();
  }
}
