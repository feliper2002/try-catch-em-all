import 'package:try_catch_em_all/app/modules/trainer/domain/entities/trainer.dart';

abstract class TrainerState {}

class InitialTrainerState extends TrainerState {}

class LoadingTrainerState extends TrainerState {}

class SuccessActionTrainerState extends TrainerState {}

class SuccessTrainerState extends TrainerState {
  final Trainer trainer;

  SuccessTrainerState(this.trainer);
}

class ErrorTrainerState extends TrainerState {
  final String message;

  ErrorTrainerState(this.message);
}
