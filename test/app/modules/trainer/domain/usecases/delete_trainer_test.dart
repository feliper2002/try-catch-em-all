import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/delete_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/delete_trainer.dart';

class DeleteTrainerRepositoryMock extends Mock
    implements DeleteTrainerRepositoryContract {}

void main() {
  late DeleteTrainerRepositoryMock repository;
  late DeleteTrainer usecase;

  setUpAll(() {
    repository = DeleteTrainerRepositoryMock();
    usecase = DeleteTrainer(repository);
  });

  test('Should Delete a Trainer', () async {
    when(() => repository.deleteTrainer(any()))
        .thenAnswer((_) async => const Right(dynamic));

    final response = await usecase("id");

    expect(
        response.fold((l) => LoadDataError(l.message), (r) {}), isA<dynamic>());
  });

  test('Should throw an Error if ID field is invalid', () async {
    when(() => repository.deleteTrainer(any()))
        .thenAnswer((_) async => const Right(dynamic));

    final response = await usecase("");
    expect(response.fold((l) => LoadDataError(l.message), (r) {}),
        isA<LoadDataError>());
  });
}
