import 'package:try_catch_em_all/app/modules/trainer/domain/entities/pokemon_hasura.dart';

class Trainer {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String region;
  final List<PokemonHasura> pokemons;
  Trainer({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.region,
    required this.pokemons,
  });
}
