import 'package:dartz/dartz.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/create_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/data/create_trainer_database_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';

class CreateTrainerRepository implements CreateTrainerRepositoryContract {
  final CreateTrainerDatabaseContract database;

  CreateTrainerRepository(this.database);

  @override
  Future<Either<ErrorTrainerState, void>> createTrainer(
      String name, int age, String gender, String region) async {
    try {
      final data = await database.createTrainer(name, age, gender, region);
      return Right(data);
    } on HasuraError catch (e) {
      throw Left(ErrorTrainerState(e.message));
    }
  }
}
