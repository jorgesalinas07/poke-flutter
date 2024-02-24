import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/utils/file_storage_utils.dart';
import 'package:pokemon_app/utils/permission_utils.dart';
import 'package:pokemon_app/widgets/pokemon_image_slider.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({super.key});


  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final pokemon = arguments['pokemon'];
    final pokemonCaptures = arguments['pokemonCaptures'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Details')
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: buildPokemonHeader(pokemon, pokemonCaptures)
            ),
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

Widget buildPokemonHeader(Pokemon pokemon, List<String> pokemonCaptures) {
  var sprites = pokemon.sprites;
  return Container(
    height: 220,
    width:double.infinity,
    color: Colors.green,
    child: Stack(
      children: [
        Container(
          alignment:Alignment.center,
          child: SizedBox(
            height: 180,
            width: 180,
            child: pokemonCaptures.isEmpty
            ? Image.network(
              sprites.frontDefault,
              fit: BoxFit.contain,
            )
            : PokemonImageSlider(imagesPath: pokemonCaptures),
          )
        ),
        Positioned(
          left: 300,
          top: 20,
          child: pokemonCaptures.isEmpty
          ? IconButton(
            icon: const Icon(Icons.camera_alt_rounded),
            color: Colors.white,
            iconSize: 60,
            onPressed: () async {
              bool cameraPermissionChecked = await checkCameraPermission();
              if (!cameraPermissionChecked) return;
              final picker = ImagePicker();
              final XFile? pickedFile = await picker.pickImage(
                source: ImageSource.camera,
              );
              if (pickedFile == null) return;
              Directory localDirectory = await FileSystemUtils.getLocalDirectory(
                'pokemon_id_${pokemon.id.toString()}'
              );
              String fileName = basename(pickedFile.path);

              String fileDestination = '${localDirectory.path}$fileName';

              File sourceFile = File(pickedFile.path);
              File destination = File(fileDestination);

              await destination
                        .writeAsBytes(await sourceFile.readAsBytes());

              debugPrint("Saved Image Path: $fileDestination");
              debugPrint(
                  "Saved Image Size: ${await File(fileDestination).length()} bytes");

            },
          ) : Container()
        ),
      ],
    )
  );
}

Widget buildStat(List<StatElement> stats) {
  var pokemonStats = stats.take(stats.length - 1);
  return Container(
    padding:const EdgeInsets.all(14),
    child: Column(
      children: pokemonStats.map((stat) {
        var statName = stat.stat.name;
        var baseStat = stat.baseStat;
        return Column( children: [
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
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  )
                ],
                ),
        const SizedBox(
                    height: 27,
                  ),
        ],
        );
      }).toList()
      )
      );
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
