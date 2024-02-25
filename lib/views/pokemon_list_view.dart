import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/utils/permission_utils.dart';
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
  void initState() {
    super.initState();
    askForPermission().then((value) => null);
  }

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
            const MyPokemonsButton(),
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

class MyPokemonsButton extends StatelessWidget {
  const MyPokemonsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Navigator.pushNamed(context, "/my-pokemons")),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 248, 238, 251),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 0.08,
                  )
                ]),
            height: 60,
            width: 300,
            child: const Text(
              "My Pokemons",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            )),
      ),
    );
  }
}
