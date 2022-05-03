import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_hasura_model.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_party_datasource_contracts/get_trainer_party_datasource_contract.dart';

class GetTrainerPartyDatasource implements GetTrainerPartyDatasourceContract {
  final HasuraConnect connect;

  GetTrainerPartyDatasource(this.connect);

  @override
  Future<List<PokemonHasuraModel>> getTrainerParty(String id) async {
    var query = '''
query ListPokemon {
  trainers(where: {id: {_eq: "24f7d18d-3907-4ddf-a026-7d040260005f"}}) {
    pokemons {
      num
      name
    }
  }
}
''';

    try {
      final response = await connect.query(query);
      final data = response['data'];
      final trainer = data['trainers'][0];
      var pokemons = trainer['pokemons'] as List;

      final lista =
          pokemons.map((poke) => PokemonHasuraModel.fromMap(poke)).toList();

      return lista;
    } on HasuraError catch (_) {
      throw DatabaseHasuraConnectionError(
          "Não foi possível se conectar com o Hasura.");
    } catch (_) {
      throw DatabaseConnectionError("Erro ao se conectar à Database.");
    }
  }
}
