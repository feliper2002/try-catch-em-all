import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';

abstract class CreateTrainerRepositoryContract {
  Future<Either<ErrorTrainerState, void>> createTrainer(
      String name, int age, String gender, String region);
}
