import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/delete_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/data/delete_trainer_database_contract.dart';

class DeleteTrainerRepository implements DeleteTrainerRepositoryContract {
  final DeleteTrainerDatabaseContract database;

  DeleteTrainerRepository(this.database);

  @override
  Future<Either<LoadDataError, void>> deleteTrainer(String id) async {
    try {
      final data = await database.deleteTrainer(id);
      return Right(data);
    } on DatabaseConnectionError catch (e) {
      throw Left(LoadDataError(e.message));
    } on DatabaseHasuraConnectionError catch (e) {
      throw Left(LoadDataError(e.message));
    }
  }
}
