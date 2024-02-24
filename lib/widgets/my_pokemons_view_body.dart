import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_captures_model.dart';
import 'package:pokemon_app/view_model/pokemon_captures_view_model.dart';
import 'package:pokemon_app/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class MyPokemonsViewBody extends StatefulWidget {
  const MyPokemonsViewBody({super.key});

  @override
  State<MyPokemonsViewBody> createState() => _MyPokemonsViewBodyState();
}

class _MyPokemonsViewBodyState extends State<MyPokemonsViewBody> {

  @override
  Widget build(BuildContext context) {
    var pokemonCapturesProvider = Provider.of<PokemonCapturesViewModel>(context);
    List<PokemonCapturesModel> pokemonCapturesList = pokemonCapturesProvider.pokemonCaptures;

    return Container(
      child: pokemonCapturesProvider.isLoading
      ? const Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: pokemonCapturesList.length,
        itemBuilder: (context, index) {
          return PokemonCard(
            pokemon: pokemonCapturesList[index].pokemon,
            pokemonCaptures: pokemonCapturesList[index].captures,
          );
        }
      ),
    );
  }

}
