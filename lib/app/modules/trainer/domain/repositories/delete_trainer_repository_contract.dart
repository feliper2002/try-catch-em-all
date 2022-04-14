import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';

abstract class DeleteTrainerRepositoryContract {
  Future<Either<ErrorTrainerState, void>> deleteTrainer(String id);
}
