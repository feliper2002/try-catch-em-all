import 'package:hasura_connect/hasura_connect.dart';
import 'package:try_catch_em_all/app/core/errors/app_errors.dart';
import 'package:try_catch_em_all/app/modules/trainer/infra/data/create_trainer_database_contract.dart';

class CreateTrainerDatabase implements CreateTrainerDatabaseContract {
  CreateTrainerDatabase(this.connect);

  final HasuraConnect connect;

  @override
  Future<String> createTrainer(
      String name, int age, String gender, String region) async {
    var mutation = '''
    mutation CreateTrainer {
  insert_trainers(objects: {name: $name, age: $age, gender: $gender, region: $region}) {
    affected_rows
    returning {
      id
    }
  }
}
''';
    try {
      final mut = await connect.mutation(mutation);
      final data = mut['data'];
      final returning = data['returning'][0];
      final id = returning['id'];
      return id;
    } on HasuraError catch (_) {
      throw DatabaseHasuraConnectionError(
          "Não foi possível se conectar com o Hasura.");
    } catch (_) {
      throw DatabaseConnectionError("Erro ao se conectar à Database.");
    }
  }
}
