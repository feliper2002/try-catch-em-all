import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/data/create_trainer_database_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/repositories/create_trainer_repository.dart';

class CreateTrainerDatabaseMock extends Mock
    implements CreateTrainerDatabaseContract {}

void main() {
  late CreateTrainerDatabaseMock database;
  late CreateTrainerRepository repository;

  setUpAll(() {
    database = CreateTrainerDatabaseMock();
    repository = CreateTrainerRepository(database);
  });

  test('Should answer to Right at fold on CreateTrainer', () async {
    when(() => database.createTrainer(any(), any(), any(), any()))
        .thenAnswer((_) async => const Right(dynamic));

    final response =
        await repository.createTrainer("Kotori", 20, "Female", "Sinnoh");

    expect(
        response.fold((l) => LoadDataError(l.message), (r) {}), isA<dynamic>());
  });

  test('Should answer to Left at fold on CreateTrainer', () async {
    when(() => database.createTrainer(any(), any(), any(), any()))
        .thenThrow(LoadDataError("message"));

    final response =
        await repository.createTrainer("Kotori", 20, "Female", "Sinnoh");

    expect(response.fold((l) => LoadDataError(l.message), (r) {}),
        isA<LoadDataError>());
  });
}
