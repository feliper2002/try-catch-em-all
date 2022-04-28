import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';

abstract class CreateTrainerRepositoryContract {
  Future<Either<LoadDataError, String>> createTrainer(
      String name, int age, String gender, String region);
}
