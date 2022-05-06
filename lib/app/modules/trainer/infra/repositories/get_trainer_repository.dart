import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/entities/trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/get_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/data/get_trainer_id_contract.dart';

class GetTrainerRepository implements GetTrainerRepositoryContract {
  final GetTrainerByIDDatabaseContract database;

  GetTrainerRepository(this.database);

  @override
  Future<Either<LoadDataError, Trainer>> getTrainer(String id) async {
    try {
      final data = await database.getTrainerByID(id);
      return Right(data);
    } on DatabaseConnectionError catch (e) {
      throw Left(LoadDataError(e.message));
    } on DatabaseHasuraConnectionError catch (e) {
      throw Left(LoadDataError(e.message));
    }
  }
}
