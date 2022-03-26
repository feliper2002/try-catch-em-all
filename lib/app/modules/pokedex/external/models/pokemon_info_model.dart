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
      description: (map['flavor_text_entries'][
              (map['flavor_text_entries'] as List)
                  .indexWhere((element) => element['language']['name'] == 'en')]
          ['flavor_text']),
    );
  }
}
