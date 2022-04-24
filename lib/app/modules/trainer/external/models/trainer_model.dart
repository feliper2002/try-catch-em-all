// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:try_catch_em_all/app/modules/trainer/domain/entities/trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/models/pokemon_hasura_model.dart';

class TrainerModel extends Trainer {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String region;
  final List<PokemonHasuraModel> pokemons;
  TrainerModel({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.region,
    required this.pokemons,
  }) : super(id: '', name: '', age: 0, gender: '', region: '', pokemons: []);

  factory TrainerModel.fromMap(Map<String, dynamic> map) {
    return TrainerModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
      gender: map['gender'] ?? '',
      region: map['region'] ?? '',
      pokemons: map['pokemons'] != null
          ? List<PokemonHasuraModel>.from(
              map['pokemons']?.map((x) => PokemonHasuraModel.fromMap(x)))
          : [],
    );
  }

  factory TrainerModel.fromJson(String source) =>
      TrainerModel.fromMap(json.decode(source));

  TrainerModel copyWith({
    String? id,
    String? name,
    int? age,
    String? gender,
    String? region,
    List<PokemonHasuraModel>? pokemons,
  }) {
    return TrainerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      region: region ?? this.region,
      pokemons: pokemons ?? this.pokemons,
    );
  }
}
