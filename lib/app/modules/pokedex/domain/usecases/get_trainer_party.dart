import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_hasura.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_party_contract/get_trainer_party_repository_contract.dart';

abstract class GetTrainerPartyContract {
  Future<Either<LoadDataError, List<PokemonHasura>>> call(String id);
}

class GetTrainerParty implements GetTrainerPartyContract {
  final GetTrainerPartyRepositoryContract repository;

  GetTrainerParty(this.repository);

  @override
  Future<Either<LoadDataError, List<PokemonHasura>>> call(String id) async {
    if (id.isEmpty) {
      return Left(UsecaseDataError("O número do pokémon é obrigatório!"));
    }

    return repository.getTrainerParty(id);
  }
}
