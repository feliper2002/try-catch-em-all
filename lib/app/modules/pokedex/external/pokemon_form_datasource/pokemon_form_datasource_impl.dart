import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_form_model.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_form_contract/pokemon_form_contract.dart';
import 'package:uno/uno.dart';

class PokemonFormDatasource implements PokemonFormDatasourceContract {
  final Uno client;

  PokemonFormDatasource(this.client);

  var baseURL = "https://pokeapi.co/api/v2/pokemon-form/";

  @override
  Future<PokemonFormModel> getPokemonForm(String id) async {
    final response = await client.get(baseURL + id);

    try {
      if (response.status == 200) {
        final data = response.data;
        return PokemonFormModel.fromMap(data);
      }
    } catch (e) {
      throw UnoError("$e");
    }
    return PokemonFormModel.fromMap(response.data);
  }
}
