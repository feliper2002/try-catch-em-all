import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_info_model.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/pokemon_info_datasource/pokemon_info_datasource.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokemon_info_repository/pokemon_info_repository_impl.dart';

class PokemonInfoDatasourceMock extends Mock implements PokemonInfoDatasource {}

void main() {
  late PokemonInfoDatasourceMock datasource;
  late PokemonInfoRepository repository;

  setUpAll(() {
    datasource = PokemonInfoDatasourceMock();
    repository = PokemonInfoRepository(datasource);
  });

  test('Should return a PokemonInfoModel from Datasource to Repository',
      () async {
    when(() => datasource.getPokemonInfo(any()))
        .thenAnswer((_) async => PokemonInfoModel());

    final response = await repository
        .getPokemonInfo("https://pokeapi.co/api/v2/pokemon-species/1/");

    expect(response.fold(id, id), isA<PokemonInfoModel>());
  });
}
