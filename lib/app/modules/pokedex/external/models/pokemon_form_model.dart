// ignore_for_file: annotate_overrides, overridden_fields

import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_form.dart';

class PokemonFormModel extends PokemonForm {
  final int? id;
  final String? name;
  final String? spriteFrontFemaleDefault;
  final String? spriteFrontDefault;
  final List<String?>? types;
  PokemonFormModel({
    this.id,
    this.name,
    this.spriteFrontFemaleDefault,
    this.spriteFrontDefault,
    this.types,
  });

  factory PokemonFormModel.fromMap(Map<String, dynamic> map) {
    return PokemonFormModel(
      id: map['id']?.toInt(),
      name: map['pokemon']['name'],
      spriteFrontFemaleDefault: map['sprites']['front_female'],
      spriteFrontDefault: map['sprites']['front_default'],
      types: map['types'] != null
          ? List<String?>.from(map['types']?.map((x) => x['type']['name']))
          : null,
    );
  }
}
