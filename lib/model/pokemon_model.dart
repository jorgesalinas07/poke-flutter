class Pokemon {
  List<Type> types;
  String name;
  Sprites sprites;

  Pokemon({
    required this.types,
    required this.name,
    required this.sprites,
  });

  factory Pokemon.fromMap(Map<dynamic, dynamic> json) => Pokemon(
        name: json["name"],
        sprites: Sprites.fromMap(json["sprites"]),
        types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
      );
}

class Sprites {
  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );
}

class TypeClass {
  String name;
  String url;

  TypeClass({
    required this.name,
    required this.url,
  });

  factory TypeClass.fromMap(Map<String, dynamic> json) => TypeClass(
        name: json["name"],
        url: json["url"],
      );
}

class Type {
  int slot;
  TypeClass type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: TypeClass.fromMap(json["type"]),
      );
}
