import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/entities/trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/create_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/create_trainer.dart';

class CreateTrainerRepositoryMock extends Mock
    implements CreateTrainerRepositoryContract {}

void main() {
  late CreateTrainerRepositoryMock repository;
  late CreateTrainer usecase;

  setUpAll(() {
    repository = CreateTrainerRepositoryMock();
    usecase = CreateTrainer(repository);
  });

  test('Should Create a Trainer', () async {
    when(() => repository.createTrainer(any(), any(), any(), any()))
        .thenAnswer((_) async => const Right("id"));

    final response = await usecase("nome", 20, "male", "Kalos");

    expect(
        response.fold((l) => LoadDataError(l.message), (r) {}), isA<dynamic>());
  });

  test('Should throw an Error if some field is invalid', () async {
    when(() => repository.createTrainer(any(), any(), any(), any()))
        .thenAnswer((_) async => const Right("id"));

    /// [Invalid Fields]:
    ///
    /// - If `name` is empty
    /// - If `age` is lower or equal than 0
    /// - If `gender` is empty
    /// - If `region` is empty

    var response = await usecase("", 20, "male", "Kalos");
    expect(response.fold((l) => LoadDataError(l.message), (r) {}),
        isA<LoadDataError>());

    response = await usecase("nome", 0, "male", "Kalos");
    expect(response.fold((l) => LoadDataError(l.message), (r) {}),
        isA<LoadDataError>());

    response = await usecase("nome", 20, "", "Kalos");
    expect(response.fold((l) => LoadDataError(l.message), (r) {}),
        isA<LoadDataError>());

    response = await usecase("nome", 20, "male", "");
    expect(response.fold((l) => LoadDataError(l.message), (r) {}),
        isA<LoadDataError>());
  });
}
