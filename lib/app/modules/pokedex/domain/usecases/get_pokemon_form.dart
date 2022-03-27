import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_form.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_form_contract/pokemon_form_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/states/pokedex_state.dart';

abstract class GetPokemonFormContract {
  Future<Either<PokedexErrorState, PokemonForm>> call(String id);
}

class GetPokemonForm implements GetPokemonFormContract {
  final PokemonFormRepositoryContract repository;

  GetPokemonForm(this.repository);

  @override
  Future<Either<PokedexErrorState, PokemonForm>> call(String id) async {
    Map<String, dynamic> errors = {};

    if (id.isEmpty) {
      errors.putIfAbsent(
          "id", () => "O ID ou nome do Pokémon são obrigatórios");
    }

    if (errors.isNotEmpty) {
      return Left(PokedexErrorState(errors['id']));
    }
    return repository.getPokemonForm(id);
  }
}
