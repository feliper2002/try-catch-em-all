import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_hasura_model.dart';

abstract class GetTrainerPartyDatasourceContract {
  Future<List<PokemonHasuraModel>> getTrainerParty(String id);
}
