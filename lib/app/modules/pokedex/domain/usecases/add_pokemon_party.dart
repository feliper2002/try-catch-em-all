import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_party_contract/add_pokemon_party_repository_contract.dart';

abstract class AddPokemonPartyContract {
  Future<Either<LoadDataError, void>> call(
      String pokemonNumber, String trainerID);
}

class AddPokemonParty implements AddPokemonPartyContract {
  final AddPokemonPartyRepositoryContract repository;

  AddPokemonParty(this.repository);

  @override
  Future<Either<LoadDataError, void>> call(
      String pokemonNumber, String trainerID) async {
    if (pokemonNumber.isEmpty) {
      return Left(UsecaseDataError("O número do Pokémon é obrigatório!"));
    }
    if (trainerID.isEmpty) {
      return Left(UsecaseDataError("O ID do(a) treinador(a) é obrigatório!"));
    }

    return repository.addPokemonParty(pokemonNumber, trainerID);
  }
}
