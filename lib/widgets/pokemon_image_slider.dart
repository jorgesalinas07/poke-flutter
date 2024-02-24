import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokemon_app/utils/file_storage_utils.dart';

class PokemonImageSlider extends StatefulWidget {
  final List<String> imagesPath;

  const PokemonImageSlider({Key? key, required this.imagesPath}) : super(key: key);

  @override
  PokemonImageSliderState createState() => PokemonImageSliderState();
}

class PokemonImageSliderState extends State<PokemonImageSlider> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.imagesPath.length,
          itemBuilder: (context, index) {
            return FutureBuilder<File>(
              future: FileSystemUtils.getImageFileFromStorage(widget.imagesPath[index]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Image.asset(
                    'images/default.jpeg',
                    height: 250.0,
                    width: MediaQuery.of(context).size.width - 40.0,
                    fit: BoxFit.cover,
                  );
                }
                if (snapshot.hasData && snapshot.data != null) {
                  return Image.file(
                    snapshot.data!
                  );
                }
                return Container();
              },
            );
          }
        )
      ],
    );
  }
}
