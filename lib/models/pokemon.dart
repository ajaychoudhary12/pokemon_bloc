class PokemonResponse {
  List<Pokemon> data;

  PokemonResponse({required this.data});

  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    List<Pokemon> data = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(Pokemon.fromJson(v));
      });
    }
    return PokemonResponse(data: data);
  }
}

class Pokemon {
  Pokemon({
    required this.name,
    required this.type,
    required this.img,
  });

  String name;
  String type;
  String img;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json["name"],
      type: json["type"],
      img: json["img"],
    );
  }
}
