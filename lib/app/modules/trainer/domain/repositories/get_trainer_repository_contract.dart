import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/models/trainer_model.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';

abstract class GetTrainerRepositoryContract {
  Future<Either<ErrorTrainerState, TrainerModel>> getTrainer(String id);
}
