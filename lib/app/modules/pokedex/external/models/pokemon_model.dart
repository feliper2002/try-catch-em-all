// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_info_model.dart';

class PokemonModel extends Pokemon {
  final int? number;
  final String? name;
  final PokemonInfoModel? info;
  PokemonModel({
    this.number,
    this.name,
    this.info,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      number: map['entry_number']?.toInt(),
      name: map['pokemon_species']['name'],
    );
  }

  factory PokemonModel.fromMapWithINFO(Map<String, dynamic> map) {
    return PokemonModel(
      number: map['entry_number']?.toInt(),
      name: map['pokemon_species']['name'],
      info: map['pokemon_species']['url'] != null
          ? PokemonInfoModel.fromMap(map['pokemon_species']['url'])
          : null,
    );
  }

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));
}
