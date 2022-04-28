import 'package:flutter/cupertino.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/create_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/delete_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/get_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';
import 'package:try_catch_em_all/app/modules/trainer/storage/trainer_storage.dart';

class TrainerController extends ValueNotifier<TrainerState> {
  TrainerController(this.createTrainerContract, this.deleteTrainerContract,
      this.getTrainerContract)
      : super(InitialTrainerState());

  final CreateTrainerContract createTrainerContract;
  final DeleteTrainerContract deleteTrainerContract;
  final GetTrainerContract getTrainerContract;

  Future<void> createTrainer(
      String name, int age, String gender, String region) async {
    final usecase = await createTrainerContract(name, age, gender, region);

    final storage = TrainerStorage();

    value = LoadingTrainerState();

    usecase.fold(
      (error) {
        value = ErrorTrainerState(error.message);
      },
      (trainerID) async {
        // ? TESTAR FUNCIONAMENTO
        await storage.recordID(trainerID);
        value = SuccessActionTrainerState();
      },
    );
  }

  Future<void> deleteTrainer(String id) async {
    final usecase = await deleteTrainerContract(id);

    value = LoadingTrainerState();

    usecase.fold(
      (error) {
        value = ErrorTrainerState(error.message);
      },
      (_) {
        value = SuccessActionTrainerState();
      },
    );
  }

  Future<void> getTrainer(String id) async {
    final usecase = await getTrainerContract(id);

    value = LoadingTrainerState();

    usecase.fold(
      (error) {
        value = ErrorTrainerState(error.message);
      },
      (trainer) {
        value = SuccessTrainerState(trainer);
      },
    );
  }
}
