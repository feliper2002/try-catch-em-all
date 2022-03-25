import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/models/pokedex_model.dart';
import 'package:try_catch_em_all/app/modules/pokedex/external/pokedex_datasource/pokedex_datasource_impl.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokedex_repository/pokedex_repository_impl.dart';

class PokedexDatasourceMock extends Mock implements PokedexDatasource {}

void main() {
  late PokedexDatasourceMock datasource;
  late PokedexRepository repository;

  setUpAll(() {
    datasource = PokedexDatasourceMock();
    repository = PokedexRepository(datasource);
  });

  test('Should return a PokedexModel - Right', () async {
    when(() => datasource.getPokedex(any()))
        .thenAnswer((_) async => PokedexModel());

    final response = await repository.getPokedex("2");

    expect(response.fold(id, id), isA<PokedexModel>());
  });
}
