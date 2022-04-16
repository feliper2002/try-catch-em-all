import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';

abstract class DeleteTrainerRepositoryContract {
  Future<Either<LoadDataError, void>> deleteTrainer(String id);
}
