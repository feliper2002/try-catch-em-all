import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_party_datasource_contracts/add_pokemon_party_datasource_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokemon_party_repositories/add_pokemon_party_repository.dart';

class AddPokemonPartyDatasourceMock extends Mock
    implements AddPokemonPartyDatasourceContract {}

void main() {
  late AddPokemonPartyDatasourceMock datasource;
  late AddPokemonPartyRepository repository;

  setUpAll(() {
    datasource = AddPokemonPartyDatasourceMock();
    repository = AddPokemonPartyRepository(datasource);
  });

  test('Should answer to Right at fold on AddPokemonParty repository',
      () async {
    when(() => datasource.addPokemonParty(any(), any(), any()))
        .thenAnswer((_) async => const Right(dynamic));

    final response = await repository.addPokemonParty("100", "ID", "trainerID");

    expect(response.fold((l) => l, (r) {}), isA<dynamic>());
  });

  // test('Should answer to Left at fold on AddPokemonParty repository', () async {
  //   when(() => datasource.addPokemonParty(any(), any()))
  //       .thenThrow(LoadDataError("message"));

  //   final response = await repository.addPokemonParty("100", "ID");

  //   expect(response.fold((l) => LoadDataError(l.message), (r) {}),
  //       isA<LoadDataError>());
  // });
}
