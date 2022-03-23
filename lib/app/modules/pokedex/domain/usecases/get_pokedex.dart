import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokedex_contract/pokedex_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';

abstract class GetPokedexContract {
  Future<Either<PokedexErrorState, Pokedex>> call(String pokedexID);
}

class GetPokedex implements GetPokedexContract {
  final PokedexRepositoryContract repository;

  GetPokedex(this.repository);

  @override
  Future<Either<PokedexErrorState, Pokedex>> call(String pokedexID) async {
    Map<String, dynamic> errors = {};

    if (pokedexID.isEmpty) {
      errors.putIfAbsent('id', () => "O ID da Pokédex é obrigatório.");
    }

    if (errors.isNotEmpty) {
      return Left(PokedexErrorState(errors['id']));
    }

    return await repository.getPokedex(pokedexID);
  }
}
