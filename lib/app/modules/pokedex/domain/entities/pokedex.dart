import 'pokemon.dart';

class Pokedex {
  final String? region;
  final List<Pokemon>? pokemonEntries;
  Pokedex({
    this.region,
    this.pokemonEntries,
  });

  Pokedex copyWith({
    String? region,
    List<Pokemon>? pokemonEntries,
  }) {
    return Pokedex(
      region: region ?? this.region,
      pokemonEntries: pokemonEntries ?? this.pokemonEntries,
    );
  }
}
