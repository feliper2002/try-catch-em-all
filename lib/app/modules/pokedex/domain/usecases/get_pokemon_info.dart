import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_info.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_info_contract/pokemon_info_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';

abstract class GetPokemonInfoContract {
  Future<Either<PokedexErrorState, PokemonInfo>> call(String url);
}

class GetPokemonInfo implements GetPokemonInfoContract {
  final PokemonInfoRepositoryContract repository;

  GetPokemonInfo(this.repository);

  @override
  Future<Either<PokedexErrorState, PokemonInfo>> call(String url) async {
    Map<String, dynamic> errors = {};

    if (url.isEmpty) {
      errors.putIfAbsent('url', () => "URL está vazia");
    }

    if (errors.isNotEmpty) {
      return Left(PokedexErrorState(errors['url']));
    }

    return repository.getPokemonInfo(url);
  }
}
