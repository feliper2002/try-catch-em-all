// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_hasura.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_trainer_party.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokemon_party_repositories/get_trainer_party_repository.dart';

class GetTrainerPartyRepositoryMock extends Mock
    implements GetTrainerPartyRepository {}

void main() {
  late GetTrainerPartyRepositoryMock repository;
  late GetTrainerParty getTrainerParty;

  setUpAll(() {
    repository = GetTrainerPartyRepositoryMock();
    getTrainerParty = GetTrainerParty(repository);
  });

  test('Should answer to Right at GetTrainerParty usecase call', () async {
    when(() => repository.getTrainerParty(any()))
        .thenAnswer((_) async => const Right(<PokemonHasura>[]));

    final usecase = await getTrainerParty("id");

    expect(usecase.fold(id, id), isA<List<PokemonHasura>>());
  });
}
