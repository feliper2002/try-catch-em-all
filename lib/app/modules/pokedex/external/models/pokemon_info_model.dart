// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_info.dart';

class PokemonInfoModel extends PokemonInfo {
  final String? color;
  final String? description;
  PokemonInfoModel({
    this.color,
    this.description,
  });

  factory PokemonInfoModel.fromMap(Map<String, dynamic> map) {
    return PokemonInfoModel(
      color: map['color'],
      description: map['flavor_text_entries'][0]['flavor_text'],
    );
  }

  factory PokemonInfoModel.fromJson(String source) =>
      PokemonInfoModel.fromMap(json.decode(source));
}
