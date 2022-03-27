import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_form.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';

abstract class PokemonFormRepositoryContract {
  Future<Either<PokedexErrorState, PokemonForm>> getPokemonForm(String id);
}
