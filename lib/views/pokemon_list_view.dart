import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/view_model/pokemon_list_view_model.dart';
import 'package:pokemon_app/views/counter_view.dart';
import 'package:pokemon_app/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({super.key});

  @override
  State<PokemonListView> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonListView> {
  @override
  Widget build(BuildContext context) {
    var pokemonProvider = Provider.of<PokemonListViewModel>(context);
    List<Pokemon> pokemonList = pokemonProvider.pokemonList;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List View'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: pokemonList.length,
                itemBuilder: (context, index) {
                  return PokemonCard(
                    pokemon: pokemonList[index],
                    pokemonCaptures: const [],
                  );
                }),
          ],
        )),
        floatingActionButton: Container(
          child: pokemonProvider.isLoading
              ? const CircularProgressIndicator()
              : CustomFloatingActionButton(
                  icon: Icons.add,
                  onPressed: () {
                    setState(() {
                      pokemonProvider.add().then((_) {
                        setState(() {});
                      });
                    });
                  },
                ),
        ));
  }
}
