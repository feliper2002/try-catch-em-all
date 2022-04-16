import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/create_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/delete_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/get_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/presenter/controllers/trainer_controller.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

class CreateTrainerMock extends Mock implements CreateTrainer {}

class DeleteTrainerMock extends Mock implements DeleteTrainer {}

class GetTrainerMock extends Mock implements GetTrainer {}

void main() {
  late TrainerController controller;
  late CreateTrainerMock createTrainer;
  late DeleteTrainerMock deleteTrainer;
  late GetTrainerMock getTrainer;

  setUpAll(() {
    createTrainer = CreateTrainerMock();
    deleteTrainer = DeleteTrainerMock();
    getTrainer = GetTrainerMock();

    controller = TrainerController(createTrainer, deleteTrainer, getTrainer);
  });

  valueListenableTest<TrainerController>("description",
      build: () => controller,
      act: (not) async =>
          await not.createTrainer("Kotori", 20, "Female", "Kalos"),
      expect: () => <TrainerState>[SuccessActionTrainerState()]);
}
