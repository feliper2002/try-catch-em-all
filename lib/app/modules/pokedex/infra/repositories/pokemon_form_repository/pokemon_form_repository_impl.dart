import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_form.dart';
import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_form_contract/pokemon_form_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_form_contract/pokemon_form_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';
import 'package:uno/uno.dart';

class PokemonFormRepository implements PokemonFormRepositoryContract {
  final PokemonFormDatasourceContract datasource;

  PokemonFormRepository(this.datasource);
  @override
  Future<Either<PokedexErrorState, PokemonForm>> getPokemonForm(
      String id) async {
    try {
      final data = await datasource.getPokemonForm(id);
      return Right(data);
    } on UnoError catch (e) {
      throw Left(PokedexErrorState(e.message));
    }
  }
}
