// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/create_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/delete_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/repositories/get_trainer_repository_contract.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/create_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/delete_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/get_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/presenter/controllers/trainer_controller.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';
import 'package:try_catch_em_all/app/modules/trainer/storage/trainer_storage.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

class CreateTrainerRepositoryMock extends Mock
    implements CreateTrainerRepositoryContract {}

class DeleteTrainerRepositoryMock extends Mock
    implements DeleteTrainerRepositoryContract {}

class GetTrainerRepositoryMock extends Mock
    implements GetTrainerRepositoryContract {}

void main() {
  late TrainerController controller;

  late CreateTrainer createTrainer;
  late CreateTrainerRepositoryMock createTrainerRepository;

  late DeleteTrainer deleteTrainer;
  late DeleteTrainerRepositoryMock deleteTrainerRepository;

  late GetTrainer getTrainer;
  late GetTrainerRepositoryMock getTrainerRepository;

  late TrainerStorage storage;

  setUpAll(() {
    createTrainerRepository = CreateTrainerRepositoryMock();
    createTrainer = CreateTrainer(createTrainerRepository);

    deleteTrainerRepository = DeleteTrainerRepositoryMock();
    deleteTrainer = DeleteTrainer(deleteTrainerRepository);

    getTrainerRepository = GetTrainerRepositoryMock();
    getTrainer = GetTrainer(getTrainerRepository);

    storage = TrainerStorage();

    controller =
        TrainerController(createTrainer, deleteTrainer, getTrainer, storage);
  });

  test(
      'Should create an user from TrainerController and emits [LoadingTrainerState, SuccessActionTrainerState]',
      () async {
    when(() =>
            createTrainerRepository.createTrainer(any(), any(), any(), any()))
        .thenAnswer((_) async => const Right("id"));

    expect(
        controller,
        emitValues(
            [isA<LoadingTrainerState>(), isA<SuccessActionTrainerState>()]));

    await controller.createTrainer("Kotori", 20, "Female", "Kalos");
  });
}
