import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/get_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/models/trainer_model.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';

abstract class GetTrainerContract {
  Future<Either<ErrorTrainerState, TrainerModel>> call(String id);
}

class GetTrainer implements GetTrainerContract {
  final GetTrainerRepositoryContract repository;

  GetTrainer(this.repository);

  @override
  Future<Either<ErrorTrainerState, TrainerModel>> call(String id) async {
    if (id.isEmpty) {
      return Left(ErrorTrainerState("O ID do(a) treinador(a) é obrigatório!"));
    }

    return repository.getTrainer(id);
  }
}
