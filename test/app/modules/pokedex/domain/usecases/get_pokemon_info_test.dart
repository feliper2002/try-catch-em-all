import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_info.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_pokemon_info.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokemon_info_repository/pokemon_info_repository_impl.dart';

class PokemonInfoRepositoryMock extends Mock implements PokemonInfoRepository {}

void main() {
  late PokemonInfoRepositoryMock repository;
  late GetPokemonInfo getPokemonInfo;

  setUpAll(() {
    repository = PokemonInfoRepositoryMock();
    getPokemonInfo = GetPokemonInfo(repository);
  });

  test('Should return a PokemonInfo object', () async {
    when(() => repository.getPokemonInfo(any()))
        .thenAnswer((_) async => Right(PokemonInfo()));

    final response =
        await getPokemonInfo("https://pokeapi.co/api/v2/pokemon-species/1/");

    expect(response.fold(id, id), isA<PokemonInfo>());
  });
}
