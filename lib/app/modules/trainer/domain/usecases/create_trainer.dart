import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/create_trainer_repository_contract.dart';

abstract class CreateTrainerContract {
  Future<Either<LoadDataError, void>> call(
      String name, int age, String gender, String region);
}

class CreateTrainer implements CreateTrainerContract {
  final CreateTrainerRepositoryContract repository;

  CreateTrainer(this.repository);

  @override
  Future<Either<LoadDataError, void>> call(
      String name, int age, String gender, String region) async {
    if (name.isEmpty) {
      return Left(LoadDataError("O nome do(a) treinador(a) é obrigatório!"));
    }
    if (gender.isEmpty) {
      return Left(LoadDataError("O gênero do(a) treinador(a) é obrigatório!"));
    }
    if (region.isEmpty) {
      return Left(LoadDataError("A região do(a) treinador(a) é obrigatório!"));
    }
    if (age <= 0) {
      return Left(LoadDataError("A idade do(a) treinador(a) é inválida!"));
    }

    return repository.createTrainer(name, age, gender, region);
  }
}
