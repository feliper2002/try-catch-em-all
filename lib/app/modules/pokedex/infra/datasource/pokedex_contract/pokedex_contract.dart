import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokedex_model.dart';

abstract class PokedexContract {
  Future<PokedexModel> getPokedex(String pokedexID);
}
