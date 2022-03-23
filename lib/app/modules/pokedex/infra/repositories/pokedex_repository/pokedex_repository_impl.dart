import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokedex.dart';
import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokedex_contract/pokedex_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokedex_contract/pokedex_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';
import 'package:uno/uno.dart';

class PokedexRepository implements PokedexRepositoryContract {
  final PokedexDatasourceContract datasource;

  PokedexRepository(this.datasource);

  @override
  Future<Either<PokedexErrorState, Pokedex>> getPokedex(
      String pokedexID) async {
    try {
      final data = await datasource.getPokedex(pokedexID);
      return Right(data);
    } on UnoError catch (e) {
      throw Left(PokedexErrorState(e.message));
    }
  }
}
