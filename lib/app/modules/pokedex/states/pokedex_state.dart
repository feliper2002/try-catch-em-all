import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_form.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_hasura.dart';
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

class PokedexPokemonFormSuccessState extends PokedexState {
  final PokemonForm form;

  PokedexPokemonFormSuccessState(this.form);
}

class PokedexErrorState extends PokedexState {
  final String? message;

  PokedexErrorState(this.message);
}

/// [Hasura] ///

class PokedexPokemonAddPartySuccessState extends PokedexState {}

class PokedexPokemonListTrainerPartyState extends PokedexState {
  final List<PokemonHasura> party;

  PokedexPokemonListTrainerPartyState(this.party);
}
