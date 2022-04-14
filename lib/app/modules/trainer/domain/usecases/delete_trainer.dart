import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/delete_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';

abstract class DeleteTrainerContract {
  Future<Either<ErrorTrainerState, void>> call(String id);
}

class DeleteTrainer implements DeleteTrainerContract {
  final DeleteTrainerRepositoryContract repository;

  DeleteTrainer(this.repository);

  @override
  Future<Either<ErrorTrainerState, void>> call(String id) async {
    if (id.isEmpty) {
      return Left(ErrorTrainerState("O ID do(a) treinador(a) é obrigatório!"));
    }

    return repository.deleteTrainer(id);
  }
}
