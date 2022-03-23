import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokedex.dart';

abstract class PokedexState {}

class PokedexInitialState extends PokedexState {}

class PokedexLoadingState extends PokedexState {}

class PokedexSuccessState extends PokedexState {
  final Pokedex pokedex;

  PokedexSuccessState(this.pokedex);
}

class PokedexErrorState extends PokedexState {
  final String? message;

  PokedexErrorState(this.message);
}
