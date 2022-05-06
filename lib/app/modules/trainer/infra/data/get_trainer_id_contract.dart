import 'package:try_catch_em_all/app/modules/trainer/domain/entities/trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/models/trainer_model.dart';

abstract class GetTrainerByIDDatabaseContract {
  Future<Trainer> getTrainerByID(String id);
}
