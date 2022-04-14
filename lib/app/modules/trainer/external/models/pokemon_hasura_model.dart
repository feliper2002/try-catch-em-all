import 'dart:convert';

class PokemonHasuraModel {
  final int num;
  final String name;

  PokemonHasuraModel({
    required this.num,
    required this.name,
  });

  factory PokemonHasuraModel.fromMap(Map<String, dynamic> map) {
    return PokemonHasuraModel(
      num: map['num']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  factory PokemonHasuraModel.fromJson(String source) =>
      PokemonHasuraModel.fromMap(json.decode(source));

  PokemonHasuraModel copyWith({
    int? num,
    String? name,
  }) {
    return PokemonHasuraModel(
      num: num ?? this.num,
      name: name ?? this.name,
    );
  }
}
