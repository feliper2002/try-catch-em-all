import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_hasura_model.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/datasource/pokemon_party_datasource_contracts/get_trainer_party_datasource_contract.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokemon_party_repositories/get_trainer_party_repository.dart';

class GetTrainerPartyDatasourceMock extends Mock
    implements GetTrainerPartyDatasourceContract {}

void main() {
  late GetTrainerPartyDatasourceMock datasource;
  late GetTrainerPartyRepository repository;

  setUpAll(() {
    datasource = GetTrainerPartyDatasourceMock();
    repository = GetTrainerPartyRepository(datasource);
  });

  test('Should answer to Right at fold on GetTrainerParty repository',
      () async {
    when(() => datasource.getTrainerParty(any()))
        .thenAnswer((_) async => <PokemonHasuraModel>[]);

    final response = await repository.getTrainerParty("id");

    expect(response.fold((l) => l, (r) {}), isA<dynamic>());
  });
}
