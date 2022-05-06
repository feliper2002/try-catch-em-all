import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/get_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/get_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/models/trainer_model.dart';

class GetTrainerRepositoryMock extends Mock
    implements GetTrainerRepositoryContract {}

void main() {
  late GetTrainerRepositoryMock repository;
  late GetTrainer usecase;
  late TrainerModel fakeTrainer;

  setUpAll(() {
    repository = GetTrainerRepositoryMock();
    usecase = GetTrainer(repository);
    fakeTrainer = TrainerModel(
      id: 'id',
      name: 'Kotori',
      age: 20,
      gender: 'Female',
      region: 'Sinnoh',
      pokemons: [],
    );
  });

  test('Should Delete a Trainer', () async {
    when(() => repository.getTrainer(any()))
        .thenAnswer((_) async => Right(fakeTrainer));

    final response = await usecase("id");

    expect(response.fold(id, id), isA<TrainerModel>());
  });

  test('Should throw an Error if ID field is invalid', () async {
    when(() => repository.getTrainer(any()))
        .thenAnswer((_) async => Right(fakeTrainer));

    final response = await usecase("");
    expect(response.fold((l) => LoadDataError(l.message), (r) {}),
        isA<LoadDataError>());
  });
}
