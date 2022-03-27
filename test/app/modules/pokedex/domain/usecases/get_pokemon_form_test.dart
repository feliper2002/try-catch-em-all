import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/entities/pokemon_form.dart';
import 'package:try_catch_em_all/app/modules/pokedex/domain/usecases/get_pokemon_form.dart';
import 'package:try_catch_em_all/app/modules/pokedex/infra/repositories/pokemon_form_repository/pokemon_form_repository_impl.dart';

class PokemonFormRepositoryMock extends Mock implements PokemonFormRepository {}

void main() {
  late PokemonFormRepositoryMock repository;
  late GetPokemonForm getPokemonForm;

  setUpAll(() {
    repository = PokemonFormRepositoryMock();
    getPokemonForm = GetPokemonForm(repository);
  });

  test('Should return a PokemonForm from repository to usecase', () async {
    when(() => repository.getPokemonForm(any()))
        .thenAnswer((_) async => Right(PokemonForm()));

    final response = await getPokemonForm("392");

    expect(response.fold(id, id), isA<PokemonForm>());
  });
}
