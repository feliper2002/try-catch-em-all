// ignore_for_file: overridden_fields, annotate_overrides

import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  final int? number;
  final String? name;
  final String? url;
  PokemonModel({
    this.number,
    this.name,
    this.url,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      number: map['entry_number']?.toInt(),
      name: map['pokemon_species']['name'],
      url: map['pokemon_species']['url'],
    );
  }
}
