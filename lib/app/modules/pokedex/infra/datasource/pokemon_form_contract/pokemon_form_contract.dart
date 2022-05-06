import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_form_model.dart';

abstract class PokemonFormDatasourceContract {
  Future<PokemonFormModel> getPokemonForm(String id);
}
