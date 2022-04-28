import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/create_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/delete_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/domain/usecases/get_trainer.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/data/create_trainer_database.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/data/delete_trainer_database.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/data/get_trainer_database.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/repositories/create_trainer_repository.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/repositories/delete_trainer_repository.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/repositories/get_trainer_repository.dart';
import 'package:try_catch_em_all/app/modules/trainer/presenter/controllers/trainer_controller.dart';
import 'package:try_catch_em_all/app/modules/trainer/presenter/view/trainer_page.dart';
import 'package:try_catch_em_all/app/modules/trainer/storage/trainer_storage.dart';
import 'package:try_catch_em_all/utils/constants/app_constants.dart';

class TrainerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HasuraConnect(AppConstants.hasuraURL)),

        /// [CreateTrainer]
        Bind((i) => CreateTrainerDatabase(i.get<HasuraConnect>())),
        Bind((i) => CreateTrainerRepository(i.get<CreateTrainerDatabase>())),
        Bind((i) => CreateTrainer(i.get<CreateTrainerRepository>())),

        /// [DeleteTrainer]
        Bind((i) => DeleteTrainerDatabase(i.get<HasuraConnect>())),
        Bind((i) => DeleteTrainerRepository(i.get<DeleteTrainerDatabase>())),
        Bind((i) => DeleteTrainer(i.get<DeleteTrainerRepository>())),

        /// [GetTrainer]
        Bind((i) => GetTrainerByIDDatabase(i.get<HasuraConnect>())),
        Bind((i) => GetTrainerRepository(i.get<GetTrainerByIDDatabase>())),
        Bind((i) => GetTrainer(i.get<GetTrainerRepository>())),

        /// [TrainerStorage]
        Bind((i) => TrainerStorage()),

        /// [TrainerController]
        Bind(
          (i) => TrainerController(
            i.get<CreateTrainer>(),
            i.get<DeleteTrainer>(),
            i.get<GetTrainer>(),
            i.get<TrainerStorage>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const TrainerPage()),
      ];
}
