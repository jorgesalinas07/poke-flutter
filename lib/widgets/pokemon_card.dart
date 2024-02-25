import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final List<String> pokemonCaptures;

  const PokemonCard(
      {super.key, required this.pokemon, required this.pokemonCaptures});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: const EdgeInsets.all(10.0),
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
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 60,
                    child: Image.network(pokemon.sprites.frontDefault),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capitalize(pokemon.name),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        capitalize(pokemon.types.first.type.name),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
      onTap: () {
        Map<String, dynamic> arguments = {
          'pokemon': pokemon,
          'pokemonCaptures': pokemonCaptures,
        };
        Navigator.pushNamed(context, "/details", arguments: arguments);
      },
    );
  }
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
