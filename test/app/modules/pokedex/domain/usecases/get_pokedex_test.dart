import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_pokedex.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokedex_repository/pokedex_repository_impl.dart';

class PokedexRepositoryMock extends Mock implements PokedexRepository {}

void main() {
  late PokedexRepositoryMock repository;
  late GetPokedex getPokedex;

  setUpAll(() {
    repository = PokedexRepositoryMock();
    getPokedex = GetPokedex(repository);
  });

  test('Should return a Pokedex object', () async {
    when(() => repository.getPokedex(any()))
        .thenAnswer((_) async => Right(Pokedex()));

    final response = await getPokedex("2");

    expect(response.fold(id, id), isA<Pokedex>());
  });
}
