import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokemon_app/model/pokemon_model.dart';

const pokemonAPIUrl = 'pokeapi.co';

class PokemonRepository {
  var client = http.Client();

  Future<Pokemon> getPokemon(int pokemonId) async {
    try {
      var response = await client
          .get(Uri.https(pokemonAPIUrl, 'api/v2/pokemon/$pokemonId'));
      var pokemonObject = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return Pokemon.fromMap(pokemonObject);
    } finally {
      client.close();
    }
  }
}
