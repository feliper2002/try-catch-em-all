import 'package:dartz/dartz.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/delete_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/data/delete_trainer_database_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';

class DeleteTrainerRepository implements DeleteTrainerRepositoryContract {
  final DeleteTrainerDatabaseContract database;

  DeleteTrainerRepository(this.database);

  @override
  Future<Either<ErrorTrainerState, void>> deleteTrainer(String id) async {
    try {
      final data = await database.deleteTrainer(id);
      return Right(data);
    } on HasuraError catch (e) {
      throw Left(ErrorTrainerState(e.message));
    }
  }
}
