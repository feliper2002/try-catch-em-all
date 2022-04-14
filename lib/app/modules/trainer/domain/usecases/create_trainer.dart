import 'package:dartz/dartz.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/create_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';

abstract class CreateTrainerContract {
  Future<Either<ErrorTrainerState, void>> call(
      String name, int age, String gender, String region);
}

class CreateTrainer implements CreateTrainerContract {
  final CreateTrainerRepositoryContract repository;

  CreateTrainer(this.repository);

  @override
  Future<Either<ErrorTrainerState, void>> call(
      String name, int age, String gender, String region) async {
    if (name.isEmpty) {
      return Left(
          ErrorTrainerState("O nome do(a) treinador(a) é obrigatório!"));
    }
    if (gender.isEmpty) {
      return Left(
          ErrorTrainerState("O gênero do(a) treinador(a) é obrigatório!"));
    }
    if (region.isEmpty) {
      return Left(
          ErrorTrainerState("A região do(a) treinador(a) é obrigatório!"));
    }
    if (age <= 0) {
      return Left(ErrorTrainerState("A idade do(a) treinador(a) é inválida!"));
    }

    return repository.createTrainer(name, age, gender, region);
  }
}
