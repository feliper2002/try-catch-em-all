import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/data/create_trainer_database_contract.dart';

class CreateTrainerDatabase implements CreateTrainerDatabaseContract {
  CreateTrainerDatabase(this.connect);

  final HasuraConnect connect;

  @override
  Future<void> createTrainer(
      String name, int age, String gender, String region) async {
    var mutation = '''
    mutation CreateTrainer {
  insert_trainers(objects: {name: $name, age: $age, gender: $gender, region: $region}) {
    affected_rows
    returning {
      id
      name
      gender
      age
      region
      created_at
    }
  }
}
''';
    try {
      await connect.mutation(mutation);
    } on HasuraError catch (_) {
      throw DatabaseHasuraConnectionError(
          "Não foi possível se conectar com o Hasura.");
    } catch (_) {
      throw DatabaseConnectionError("Erro ao se conectar à Database.");
    }
  }
}
