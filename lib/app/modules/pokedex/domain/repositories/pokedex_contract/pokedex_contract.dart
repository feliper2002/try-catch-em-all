import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';

abstract class PokedexRepositoryContract {
  Future<Either<PokedexErrorState, Pokedex>> getPokedex(String pokedexID);
}
