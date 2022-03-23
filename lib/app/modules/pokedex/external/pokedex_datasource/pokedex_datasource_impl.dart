import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokedex_model.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokedex_contract/pokedex_contract.dart';
import 'package:uno/uno.dart';

class PokedexDatasource implements PokedexContract {
  final Uno client;

  PokedexDatasource(this.client);

  @override
  Future<PokedexModel> getPokedex(String pokedexID) async {
    const baseURL = "https://pokeapi.co/api/v2/pokedex/";

    final response = await client.get(baseURL + pokedexID);

    try {
      if (response.status == 200) {
        final data = response.data;
        return PokedexModel.fromMap(data);
      }
    } catch (e) {
      throw UnoError("Erro na conexão - $e");
    }
    return PokedexModel.fromMap(response.data);
  }
}

// Future<void> main() async {
//   final client = Uno();
//   final data = PokedexDatasource(client);

//   final dex = await data.getPokedex('2');

//   print(dex.pokemonEntries![34].name);
// }
