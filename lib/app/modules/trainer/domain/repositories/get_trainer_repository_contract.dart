import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/entities/trainer.dart';

abstract class GetTrainerRepositoryContract {
  Future<Either<LoadDataError, Trainer>> getTrainer(String id);
}
