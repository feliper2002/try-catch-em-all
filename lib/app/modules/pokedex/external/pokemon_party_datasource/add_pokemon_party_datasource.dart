import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_party_datasource_contracts/add_pokemon_party_datasource_contract.dart';

class AddPokemonPartyDatasource implements AddPokemonPartyDatasourceContract {
  final HasuraConnect connect;

  AddPokemonPartyDatasource(this.connect);

  @override
  Future<void> addPokemonParty(String pokemonNumber, String trainerID) async {
    var mutation = '''
mutation AddPokemonToParty {
  insert_pokemon_one(object: {num: "$pokemonNumber", trainer_id: "$trainerID"}) {
    trainer_id
    num
  }
}
''';

    try {
      await connect.mutation(mutation);
    } on HasuraError catch (_) {
      throw DatabaseHasuraConnectionError(
          "Não foi possível se conectar com o Hasura.");
    } catch (_) {
      throw DatabaseConnectionError("Erro ao se conectar à Database.");
    }
  }
}
