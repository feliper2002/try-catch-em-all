import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_info.dart';

abstract class PokedexState {}

class PokedexInitialState extends PokedexState {}

class PokedexLoadingState extends PokedexState {}

class PokedexSuccessState extends PokedexState {
  final Pokedex pokedex;

  PokedexSuccessState(this.pokedex);
}

class PokedexPokemonInfoSuccessState extends PokedexState {
  final PokemonInfo info;

  PokedexPokemonInfoSuccessState(this.info);
}

class PokedexErrorState extends PokedexState {
  final String? message;

  PokedexErrorState(this.message);
}
