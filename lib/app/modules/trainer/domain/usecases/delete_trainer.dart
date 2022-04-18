import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/delete_trainer_repository_contract.dart';

abstract class DeleteTrainerContract {
  Future<Either<LoadDataError, void>> call(String id);
}

class DeleteTrainer implements DeleteTrainerContract {
  final DeleteTrainerRepositoryContract repository;

  DeleteTrainer(this.repository);

  @override
  Future<Either<LoadDataError, void>> call(String id) async {
    if (id.isEmpty) {
      return Left(LoadDataError("O ID do(a) treinador(a) é obrigatório!"));
    }

    return repository.deleteTrainer(id);
  }
}
