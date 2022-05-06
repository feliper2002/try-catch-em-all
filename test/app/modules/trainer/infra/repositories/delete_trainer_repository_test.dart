import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/data/delete_trainer_database_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/repositories/delete_trainer_repository.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';

class DeleteTrainerDatabaseMock extends Mock
    implements DeleteTrainerDatabaseContract {}

void main() {
  late DeleteTrainerDatabaseMock database;
  late DeleteTrainerRepository repository;

  setUpAll(() {
    database = DeleteTrainerDatabaseMock();
    repository = DeleteTrainerRepository(database);
  });

  test('Should answer to Right at fold on DeleteTrainer', () async {
    when(() => database.deleteTrainer(any()))
        .thenAnswer((_) async => const Right(dynamic));

    final response = await repository.deleteTrainer("id");

    expect(response.fold((l) => ErrorTrainerState(l.message), (r) {}),
        isA<dynamic>());
  });
}
