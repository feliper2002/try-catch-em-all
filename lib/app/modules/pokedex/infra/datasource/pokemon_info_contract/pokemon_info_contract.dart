import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_info_model.dart';

abstract class PokemonInfoDatasourceContract {
  Future<PokemonInfoModel> getPokemonInfo(String url);
}
