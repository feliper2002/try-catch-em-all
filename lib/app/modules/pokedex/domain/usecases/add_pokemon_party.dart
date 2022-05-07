import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_party_contract/add_pokemon_party_repository_contract.dart';

abstract class AddPokemonPartyContract {
  Future<Either<LoadDataError, void>> call(
      String pokemonNumber, String name, String trainerID, String url);
}

class AddPokemonParty implements AddPokemonPartyContract {
  final AddPokemonPartyRepositoryContract repository;

  AddPokemonParty(this.repository);

  @override
  Future<Either<LoadDataError, void>> call(
      String pokemonNumber, String name, String trainerID, String url) async {
    try {
      final response =
          await repository.addPokemonParty(pokemonNumber, name, trainerID, url);

      if (pokemonNumber.isEmpty) {
        return Left(UsecaseDataError("O número do Pokémon é obrigatório!"));
      }
      if (trainerID.isEmpty) {
        return Left(UsecaseDataError("O ID do(a) treinador(a) é obrigatório!"));
      }
      return response;
    } on LoadDataError catch (e) {
      throw Left(DataError(e.message));
    }
  }
}
