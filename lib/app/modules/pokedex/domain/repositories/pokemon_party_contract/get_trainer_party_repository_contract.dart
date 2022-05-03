import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_hasura.dart';

abstract class GetTrainerPartyRepositoryContract {
  Future<Either<LoadDataError, List<PokemonHasura>>> getTrainerParty(String id);
}
