import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_party_contract/add_pokemon_party_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_party_datasource_contracts/add_pokemon_party_datasource_contract.dart';

class AddPokemonPartyRepository implements AddPokemonPartyRepositoryContract {
  final AddPokemonPartyDatasourceContract datasource;

  AddPokemonPartyRepository(this.datasource);

  @override
  Future<Either<LoadDataError, void>> addPokemonParty(
      String pokemonNumber, String name, String trainerID) async {
    try {
      final data =
          await datasource.addPokemonParty(pokemonNumber, name, trainerID);
      return Right(data);
    } on DatabaseConnectionError catch (e) {
      throw Left(LoadDataError(e.message));
    } on DatabaseHasuraConnectionError catch (e) {
      throw Left(LoadDataError(e.message));
    }
  }
}
