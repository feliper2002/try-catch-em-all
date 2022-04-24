// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:try_catch_em_all/app/modules/trainer/domain/entities/pokemon_hasura.dart';

class PokemonHasuraModel extends PokemonHasura {
  final int num;
  final String name;

  PokemonHasuraModel({
    required this.num,
    required this.name,
  }) : super(0, '');

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
