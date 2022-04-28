import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';

abstract class AddPokemonPartyRepositoryContract {
  Future<Either<LoadDataError, void>> addPokemonParty(
      String pokemonNumber, String trainerID);
}
