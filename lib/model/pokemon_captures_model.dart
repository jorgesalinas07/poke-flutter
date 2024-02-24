import 'package:pokemon_app/model/pokemon_model.dart';

class PokemonCapturesModel {
  List<String> captures;
  Pokemon pokemon;

  final List<PokemonCapturesModel> _pokemonCaptures = [];

  List<PokemonCapturesModel> get pokemonCaptures => _pokemonCaptures;

    PokemonCapturesModel({
        required this.captures,
        required this.pokemon,
    });
}
