import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_hasura.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_party_contract/get_trainer_party_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_party_datasource_contracts/get_trainer_party_datasource_contract.dart';

class GetTrainerPartyRepository implements GetTrainerPartyRepositoryContract {
  final GetTrainerPartyDatasourceContract datasource;

  GetTrainerPartyRepository(this.datasource);

  @override
  Future<Either<LoadDataError, List<PokemonHasura>>> getTrainerParty(
      String id) async {
    try {
      final data = await datasource.getTrainerParty(id);
      return Right(data);
    } on DatabaseConnectionError catch (e) {
      throw Left(LoadDataError(e.message));
    } on DatabaseHasuraConnectionError catch (e) {
      throw Left(LoadDataError(e.message));
    }
  }
}
