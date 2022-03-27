import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_form.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokemon_form_model.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/pokemon_form_datasource/pokemon_form_datasource_impl.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokemon_form_repository/pokemon_form_repository_impl.dart';

class PokemonFormDatasourceMock extends Mock implements PokemonFormDatasource {}

void main() {
  late PokemonFormDatasourceMock datasource;
  late PokemonFormRepository repository;

  setUpAll(() {
    datasource = PokemonFormDatasourceMock();
    repository = PokemonFormRepository(datasource);
  });

  test('Should return a PokemonForm from datasource to repository', () async {
    when(() => datasource.getPokemonForm(any()))
        .thenAnswer((_) async => PokemonFormModel());

    final response = await repository.getPokemonForm("392");

    expect(response.fold(id, id), isA<PokemonForm>());
  });
}
