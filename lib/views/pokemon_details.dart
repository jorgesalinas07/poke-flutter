import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon Details')),
      body: Center(
        child: Column(
          children: [
            Container(child: buildPokemonHeader(pokemon)),
            Column(
              children: [
                Text(
                  capitalize(pokemon.name),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const Text(
                  "Weight:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "${pokemon.weight} Pounds",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Stats:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: buildStat(pokemon.stats),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildPokemonHeader(Pokemon pokemon) {
  var sprites = pokemon.sprites;
  return Container(
      height: 220,
      width: double.infinity,
      color: Colors.green,
      child: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 180,
                  width: 180,
                  child: Image.network(
                    sprites.frontDefault,
                    fit: BoxFit.contain,
                  ))),
          Positioned(
              left: 300,
              top: 20,
              child: IconButton(
                icon: const Icon(Icons.camera_alt_rounded),
                color: Colors.white,
                iconSize: 60,
                onPressed: () {},
              )),
        ],
      ));
}

Widget buildStat(List<StatElement> stats) {
  var pokemonStats = stats.take(stats.length - 1);
  return Container(
      padding: const EdgeInsets.all(14),
      child: Column(
          children: pokemonStats.map((stat) {
        var statName = stat.stat.name;
        var baseStat = stat.baseStat;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "images/stats_types/${statName.replaceFirst(RegExp(r'(\-)'), '_')}.png",
                      fit: BoxFit.contain,
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      capitalize(statName),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Text(
                  baseStat.toString(),
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
            const SizedBox(
              height: 27,
            ),
          ],
        );
      }).toList()));
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);