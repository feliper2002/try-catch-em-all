// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:try_catch_em_all/app/modules/trainer/domain/entities/pokemon_hasura.dart';

class PokemonHasuraModel extends PokemonHasura {
  final String number;
  final String name;

  PokemonHasuraModel({
    required this.number,
    required this.name,
  }) : super("", '');

  factory PokemonHasuraModel.fromMap(Map<String, dynamic> map) {
    return PokemonHasuraModel(
      number: map['num'] ?? "",
      name: map['name'] ?? '',
    );
  }

  factory PokemonHasuraModel.fromJson(String source) =>
      PokemonHasuraModel.fromMap(json.decode(source));

  PokemonHasuraModel copyWith({
    String? number,
    String? name,
  }) {
    return PokemonHasuraModel(
      number: number ?? this.number,
      name: name ?? this.name,
    );
  }
}
