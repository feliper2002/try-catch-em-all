import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/data/create_trainer_database.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/data/delete_trainer_database.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/data/get_trainer_database.dart';

class TrainerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) =>
            HasuraConnect("https://try-catch-em-all.herokuapp.com/v1/graphql")),
        Bind((i) => CreateTrainerDatabase(i.get<HasuraConnect>())),
        Bind((i) => DeleteTrainerDatabase(i.get<HasuraConnect>())),
        Bind((i) => GetTrainerByIDDatabase(i.get<HasuraConnect>())),
      ];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute('/', child: (_, args) => const PokedexList()),
      ];
}
