import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/external/models/trainer_model.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/data/get_trainer_id_contract.dart';

class GetTrainerByIDDatabase implements GetTrainerByIDDatabaseContract {
  final HasuraConnect connect;

  GetTrainerByIDDatabase(this.connect);

  @override
  Future<TrainerModel> getTrainerByID(String id) async {
    var query = '''
query GetTrainerByID {
  trainers(where: {id: {_eq: $id}}) {
    id
    name
    gender
    region
    pokemons {
      num
      name
    }
  }
}''';

    try {
      final response = await connect.query(query);
      final data = response['data'];
      final trainer = data['trainers'][0];

      final trainerJson = jsonEncode(trainer);

      return TrainerModel.fromJson(trainerJson);
    } on HasuraError catch (_) {
      throw DatabaseHasuraConnectionError(
          "Não foi possível se conectar com o Hasura.");
    } catch (_) {
      throw DatabaseConnectionError("Erro ao se conectar à Database.");
    }
  }
}
