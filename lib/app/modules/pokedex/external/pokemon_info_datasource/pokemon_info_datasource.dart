import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_info_model.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_info_contract/pokemon_info_contract.dart';
import 'package:uno/uno.dart';

class PokemonInfoDatasource implements PokemonInfoContract {
  final Uno client;

  PokemonInfoDatasource(this.client);

  @override
  Future<PokemonInfoModel> getPokemonInfo(String url) async {
    final response = await client.get(url);

    try {
      if (response.status == 200) {
        final data = response.data;
        return PokemonInfoModel.fromMap(data);
      }
    } catch (e) {
      throw UnoError("Erro de conexão - $e");
    }
    return PokemonInfoModel.fromMap(response.data);
  }
}
