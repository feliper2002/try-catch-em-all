import 'package:try_catch_em_all/app/modules/trainer/external/models/trainer_model.dart';

abstract class TrainerState {}

class InitialTrainerState extends TrainerState {}

class LoadingTrainerState extends TrainerState {}

class SuccessTrainerState extends TrainerState {
  final TrainerModel trainer;

  SuccessTrainerState(this.trainer);
}

class ErrorTrainerState extends TrainerState {
  final String message;

  ErrorTrainerState(this.message);
}
