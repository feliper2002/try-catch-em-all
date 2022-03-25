import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_info.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';

abstract class PokemonInfoRepositoryContract {
  Future<Either<PokedexErrorState, PokemonInfo>> getPokemonInfo(String url);
}
