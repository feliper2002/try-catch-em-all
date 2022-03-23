// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_model.dart';

class PokedexModel extends Pokedex {
  final String? region;
  final List<PokemonModel>? pokemonEntries;
  PokedexModel({
    this.region,
    this.pokemonEntries,
  });

  factory PokedexModel.fromMap(Map<String, dynamic> map) {
    return PokedexModel(
      region: map['name'],
      pokemonEntries: map['pokemon_entries'] != null
          ? List<PokemonModel>.from(
              map['pokemon_entries']?.map((x) => PokemonModel.fromMap(x)))
          : null,
    );
  }

  factory PokedexModel.fromJson(String source) =>
      PokedexModel.fromMap(json.decode(source));
}
