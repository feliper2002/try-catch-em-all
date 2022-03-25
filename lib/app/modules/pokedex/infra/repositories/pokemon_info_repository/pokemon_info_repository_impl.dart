import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_info.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_info_contract/pokemon_info_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_info_contract/pokemon_info_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';
import 'package:uno/uno.dart';

class PokemonInfoRepository implements PokemonInfoRepositoryContract {
  final PokemonInfoDatasourceContract datasource;

  PokemonInfoRepository(this.datasource);

  @override
  Future<Either<PokedexErrorState, PokemonInfo>> getPokemonInfo(
      String url) async {
    try {
      final data = await datasource.getPokemonInfo(url);
      return Right(data);
    } on UnoError catch (e) {
      throw Left(PokedexErrorState(e.message));
    }
  }
}
