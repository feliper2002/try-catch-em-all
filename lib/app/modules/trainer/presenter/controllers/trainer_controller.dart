import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/create_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/delete_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/get_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/states/trainer_states.dart';
import 'package:try_catch_em_all/app/modules/trainer/storage/trainer_storage.dart';

class TrainerController extends ValueNotifier<TrainerState> {
  TrainerController(
    this.createTrainerContract,
    this.deleteTrainerContract,
    this.getTrainerContract,
    this.storage,
  ) : super(InitialTrainerState());

  final CreateTrainerContract createTrainerContract;
  final DeleteTrainerContract deleteTrainerContract;
  final GetTrainerContract getTrainerContract;

  final TrainerStorageContract storage;

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController(text: "Masculino");
  final regionController = TextEditingController(text: "Kanto");

  Future<String> _getTrainerID() async {
    String _id = '';

    bool exists = await storage.trainerExists();

    if (exists) {
      _id = await storage.id;
    }
    return _id;
  }

  Future<void> createTrainer(
      String name, String age, String gender, String region) async {
    int _age = 0;

    try {
      _age = NumberFormat().parse(age).toInt();
    } on FormatException catch (e) {
      value = ErrorTrainerState(e.message);
    }

    final usecase = await createTrainerContract(name, _age, gender, region);

    value = LoadingTrainerState();

    usecase.fold(
      (error) {
        value = ErrorTrainerState(error.message);
      },
      (trainerID) async {
        await storage.recordID(trainerID);
        value = SuccessActionTrainerState();
      },
    );
  }

  Future<void> deleteTrainer() async {
    final _id = await _getTrainerID();

    final usecase = await deleteTrainerContract(_id);

    value = LoadingTrainerState();

    usecase.fold(
      (error) {
        value = ErrorTrainerState(error.message);
      },
      (_) async {
        await _deleteTrainerFromLocalStorage();
        value = SuccessActionTrainerState();
      },
    );
  }

  Future<void> getTrainer() async {
    final _id = await _getTrainerID();

    final usecase = await getTrainerContract(_id);

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

  Future<void> _deleteTrainerFromLocalStorage() async {
    await storage.clear();
  }
}
