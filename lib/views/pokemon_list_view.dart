import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/view_model/pokemon_list_view_model.dart';
import 'package:pokemon_app/views/counter_view.dart';
import 'package:pokemon_app/widgets/pokemon_card.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({super.key});

  @override
  State<PokemonListView> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonListView> {
  final PokemonListViewModel pokemonListViewModel =
      PokemonListViewModel();

  @override
  Widget build(BuildContext context) {
    List<Pokemon> pokemonList = pokemonListViewModel.pokemonList;

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
          child: pokemonListViewModel.isLoading
              ? const CircularProgressIndicator()
              : CustomFloatingActionButton(
                  icon: Icons.add,
                  onPressed: () {
                    setState(() {
                      pokemonListViewModel.add().then((_) {
                        setState(() {});
                      });
                    });
                  },
                ),
        ));
  }
}
