import 'package:flutter/material.dart';
import 'package:pokemon_app/view_model/pokemon_captures_view_model.dart';
import 'package:pokemon_app/widgets/my_pokemons_view_body.dart';
import 'package:provider/provider.dart';

class MyPokemonsView extends StatelessWidget {
  const MyPokemonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pokemons List'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => PokemonCapturesViewModel(),
            lazy: false,
          ),
        ],
        child: const MyPokemonsViewBody(),
      )
    );
  }

}
