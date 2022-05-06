import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/entities/trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/get_trainer_repository_contract.dart';

abstract class GetTrainerContract {
  Future<Either<LoadDataError, Trainer>> call(String id);
}

class GetTrainer implements GetTrainerContract {
  final GetTrainerRepositoryContract repository;

  GetTrainer(this.repository);

  @override
  Future<Either<LoadDataError, Trainer>> call(String id) async {
    if (id.isEmpty) {
      return Left(LoadDataError("O ID do(a) treinador(a) é obrigatório!"));
    }

    return repository.getTrainer(id);
  }
}
