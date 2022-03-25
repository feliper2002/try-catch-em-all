// ignore_for_file: overridden_fields, annotate_overrides

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
      color: map['color']['name'],
      description: map['flavor_text_entries'][0]['flavor_text'],
    );
  }
}
