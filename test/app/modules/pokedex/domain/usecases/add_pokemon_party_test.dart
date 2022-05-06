// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/repositories/pokemon_party_contract/add_pokemon_party_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/add_pokemon_party.dart';

class AddPokemonPartyRepositoryMock extends Mock
    implements AddPokemonPartyRepositoryContract {}

void main() {
  late AddPokemonPartyRepositoryMock repository;
  late AddPokemonParty addPokemonParty;

  setUpAll(() {
    repository = AddPokemonPartyRepositoryMock();
    addPokemonParty = AddPokemonParty(repository);
  });

  test('Should answer to Right at AddPokemonParty usecase call', () async {
    when(() => repository.addPokemonParty(any(), any(), any()))
        .thenAnswer((_) async => const Right(dynamic));

    final usecase = await addPokemonParty("100", "ID", "trainerID");

    expect(usecase.fold((l) => l, (r) {}), isA<dynamic>());
  });
}
